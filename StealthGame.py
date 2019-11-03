import pygame
import random
from math import sin, cos, radians

pygame.init()
font = pygame.font.Font(None, 72)


class Player(object):
    def __init__(self, x, y, radius, vel=7):
        self.x = x
        self.y = y
        self.radius = radius
        self.vel = vel


player = Player(250, 250, 15)


class Obstacle(object):
    def __init__(self):
        self.x = random.randint(0, 100)
        self.y = random.randint(0, 100)
        self.w = 50
        self.h = self.w
        self.vel = 5
        self.direction = random.randint(0, 360)
        self.xv = sin(radians(self.direction)) * 3
        self.yv = cos(radians(self.direction)) * 3

    def Move(self):
        self.x += self.xv
        self.y += self.yv

    def DrawObst(self, screen):
        pygame.draw.rect(screen, (0, 223, 217), (self.x, self.y, self.w, self.h))


def CreateObst(x):
    return [Obstacle() for i in range(1, x)]


amount = 10
obstacles = CreateObst(amount)



def Collided():
    for obstacle in obstacles:
        if obstacle.x < player.x - player.radius and player.x - player.radius < obstacle.x + obstacle.w \
                and obstacle.y < player.y + player.radius and player.y - player.radius < obstacle.y + obstacle.h:
            return True


def CheckOut():
    for obstacle in obstacles:
        if obstacle.x < 0 or obstacle.x + obstacle.w > 500:
            obstacle.xv *= -1
        if obstacle.y < 0 or obstacle.y + obstacle.h > 500:
            obstacle.yv *= -1


class SceneBase:
    def __init__(self):
        self.next = self

    def ProcessInput(self, events, pressed_keys):
        print("uh-oh, you didn't override this in the child class")

    def Update(self):
        print("uh-oh, you didn't override this in the child class")

    def Render(self, screen):
        print("uh-oh, you didn't override this in the child class")

    def SwitchToScene(self, next_scene):
        self.next = next_scene

    def Terminate(self):
        self.SwitchToScene(None)


def run_game(width, height, fps, starting_scene):
    screen = pygame.display.set_mode((width, height))
    clock = pygame.time.Clock()
    active_scene = starting_scene

    while active_scene != None:
        pressed_keys = pygame.key.get_pressed()

        # Event filtering
        filtered_events = []
        for event in pygame.event.get():
            quit_attempt = False
            if event.type == pygame.QUIT:
                quit_attempt = True
            elif event.type == pygame.KEYDOWN:
                alt_pressed = pressed_keys[pygame.K_LALT] or \
                              pressed_keys[pygame.K_RALT]
                if event.key == pygame.K_ESCAPE:
                    quit_attempt = True
                elif event.key == pygame.K_F4 and alt_pressed:
                    quit_attempt = True

            if quit_attempt:
                active_scene.Terminate()
            else:
                filtered_events.append(event)

        active_scene.ProcessInput(filtered_events, pressed_keys)
        active_scene.Update()
        active_scene.Render(screen)

        active_scene = active_scene.next

        pygame.display.flip()
        clock.tick(fps)


class TitleScene(SceneBase):
    def __init__(self):
        SceneBase.__init__(self)

    def ProcessInput(self, events, pressed_keys):
        for event in events:
            if event.type == pygame.MOUSEBUTTONDOWN:
                click_pos = pygame.mouse.get_pos()
                if event.button == 1 and 100 < click_pos[0] < 400 and 100 < click_pos[1] < 200:
                    self.SwitchToScene(GameScene())
                if event.button == 1 and 100 < click_pos[0] < 400 and 300 < click_pos[1] < 400:
                    self.Terminate()

    def Update(self):
        pass

    def Render(self, screen):
        screen.fill((102, 153, 255))
        pygame.draw.rect(screen, (146, 25, 25), (100, 100, 300, 100))
        text = font.render("Start", 1, (16, 183, 59))
        place = text.get_rect(center=(250, 150))
        text.get_rect()
        screen.blit(text, place)
        pygame.draw.rect(screen, (146, 25, 25), (100, 300, 300, 100))
        text = font.render("Close", 1, (16, 183, 59))
        place = text.get_rect(center=(250, 350))
        text.get_rect()
        screen.blit(text, place)


class GameScene(SceneBase):
    def __init__(self):
        SceneBase.__init__(self)

    def ProcessInput(self, events, pressed_keys):
        for event in events:
            pass
        if pressed_keys[
            pygame.K_LEFT] and player.x > player.vel:  # Making sure the top left position of our character is greater than our vel so we never move off the screen.
            player.x -= player.vel

        if pressed_keys[
            pygame.K_RIGHT] and player.x < 500 - player.vel - player.radius:  # Making sure the top right corner of our character is less than the screen width - its width
            player.x += player.vel

        if pressed_keys[pygame.K_UP] and player.y > player.vel:  # Same principles apply for the y coordinate
            player.y -= player.vel

        if pressed_keys[pygame.K_DOWN] and player.y < 500 - player.radius - player.vel:
            player.y += player.vel

    def Update(self):
        CheckOut()
        for obstacle in obstacles:
            obstacle.Move()
        if Collided():
            self.SwitchToScene(DeathScene())

    def Render(self, screen):
        screen.fill((122, 126, 164))
        for obstacle in obstacles:
            obstacle.DrawObst(screen)
            obstacle.Move()
        pygame.draw.circle(screen, (255, 0, 0), (player.x, player.y), player.radius)


class DeathScene(SceneBase):
    def __init__(self):
        SceneBase.__init__(self)

    def ProcessInput(self, events, pressed_keys):
        for event in events:
            if event.type == pygame.MOUSEBUTTONDOWN:
                click_pos = pygame.mouse.get_pos()
                if event.button == 1 and 100 < click_pos[0] < 400 and 100 < click_pos[1] < 200:
                    obstacles.clear()
                    self.SwitchToScene(GameScene())
                    obstacles.append(CreateObst(10))
                if event.button == 1 and 100 < click_pos[0] < 400 and 300 < click_pos[1] < 400:
                    self.Terminate()

    def Update(self):
        pass

    def Render(self, screen):
        screen.fill((0, 0, 0))
        screen.fill((102, 153, 255))
        pygame.draw.rect(screen, (146, 25, 25), (100, 100, 300, 100))
        text = font.render("Play Again", 1, (16, 183, 59))
        place = text.get_rect(center=(250, 150))
        text.get_rect()
        screen.blit(text, place)
        pygame.draw.rect(screen, (146, 25, 25), (100, 300, 300, 100))
        text = font.render("Exit", 1, (16, 183, 59))
        place = text.get_rect(center=(250, 350))
        text.get_rect()
        screen.blit(text, place)


run_game(500, 500, 60, TitleScene())
