#include <String.h> 
#include <stdio.h> 
#include <locale.h> 
#include <string.h>

void oneTime(char* arrChar)
{
	char word[10], *p, *start = arrChar;
	int i = 0, j = 0, n = 0;
	while (arrChar[i]) {
		if (arrChar[i] != ',' && arrChar[i] != '.') {
			word[j] = arrChar[i];
			j++;
		}
		else {
			word[j] = '\0';
			j = 0;
			while (1) {
				p = strstr(start, word);
				if (p == NULL)break;
				n++;
				if (n > 1)break;
				start = p + strlen(word);
			}
			if (n <= 1)
			{
				for (int i = 0; i < strlen(word); i++)
				{
					printf_s("%c", word[i]);
				}
				printf_s(" ");
			}
			n = 0;
			start = arrChar;
		}
		i++;
	}
}

void alfa(char* arr)
{
	char newArr[255];
	strcpy_s(newArr, 255, arr);
	int mas[5];
	int k = 0;
	int count = 0;
	char* token1, *next_token1;
	token1 = strtok_s(arr, ",.", &next_token1);

	while ((token1 != NULL))
	{
		if (token1 != NULL)
		{
			for (int i = 0; i < strlen(token1); i++)
			{
				count = count + token1[i];
			}
			mas[k] = count;
			k++;
			count = 0;
			token1 = strtok_s(NULL, ",.", &next_token1);
		}
	}

	int isDone = 0;
	int countOfWord = 1;
	for (int i = 1; i < k; i++)
	{
		if (mas[i] > mas[i - 1] && mas[i] < mas[i + 1])
		{
			for (int z = 0; z < strlen(newArr); z++)
			{
				if (newArr[z] == ',')
				{
					countOfWord++;
				}
				if (countOfWord == (i + 1) && isDone == 0)
				{
					for (int j = z + 1; newArr[j] != ','; j++)
					{
						printf_s("%c", newArr[j]);
					}
					isDone = 1;
				}
			}
		}
	}
	if (isDone == 0)
	{
		puts("Слова для второго задания не найдено!");
	}
}

int countOfWordsAndLetters(char arrChar[]) //Функция, которая проверяет правильность вводимой строки
{
	int isCorrect = 1;
	int countOfWords = 1; //Счетчик слов
	int countOfLetters = 0; //Счетчик букв каждого слова
	for (int i = 0; i < strlen(arrChar); i++)
	{
		if (arrChar[i] == ',')
		{
			countOfWords++;
		}
		if (arrChar[i] != ',')
		{
			if (countOfLetters > 5)
			{
				isCorrect = 0;
			}
			countOfLetters++;
		}
		else if (arrChar[i] == ',' || arrChar[i] == '.')
		{
			countOfLetters = 0;
		}
	}
	if (countOfWords > 5)
	{
		isCorrect = 0;
	}

	return isCorrect;
}

int main()
{
	setlocale(LC_ALL, "RUS");
	char string[30];
	char buff[5];
	puts("Введите строку до 5 слов, в каждом из которых до 5 букв, между которыми запятые, а после последнего слова символ '.'");
	while (string[strlen(string) - 1] != '.' || countOfWordsAndLetters(string) == 0) //Пользователь будет вводить строку, пока не введет ее верно, согласно заданию
	{
		gets(string);
		if (string[strlen(string) - 1] != '.' || countOfWordsAndLetters(string) == 0)
		{
			puts("Строка введена неверно! Попробуйте еще раз: ");
		}
	}
	puts("Слова, встречающиеся в строке всего раз: ");
	oneTime(string);
	printf("\n");
	puts("Второе: ");
	alfa(string);
	printf("\n");
	system("pause");
}