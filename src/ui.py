from email.mime import image
import pygame
class UI:

    def __init__(self):
        self.STATUS = "MENU"
        self.imagem = pygame.image.load("../assets/textures/jogar.png").convert()

    def update(self):
        return

    def render(self,screen):
        self.update()
        match(self.STATUS):
            case "MENU":
                self.drawMenu(screen)
                return
            case _:
                print("algo de errado não está certo em render de UI")
                return

    def drawMenu(self, screen):
        pass
        #screen.blit(self.imagem, (100,100))

