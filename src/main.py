import sys
import pygame   as pg
import moderngl as mgl

from modelo import *
from camera import Camera


class Engine:
     def __init__(self, win_size=(1080, 640)):
          # Inicia o pygame
          pg.display.init()
          pg.display.set_caption("Jogo MC426")

          # Estabelece o tamanho da janela
          self.WIN_SIZE = win_size

          # Estabelece os atributos do contexto OpenGL
          pg.display.gl_set_attribute(pg.GL_CONTEXT_MAJOR_VERSION, 3)
          pg.display.gl_set_attribute(pg.GL_CONTEXT_MINOR_VERSION, 3)
          pg.display.gl_set_attribute(pg.GL_CONTEXT_PROFILE_MASK, pg.GL_CONTEXT_PROFILE_CORE)

          # Cria o contexto OpenGL
          pg.display.set_mode(self.WIN_SIZE, flags=pg.OPENGL | pg.DOUBLEBUF)

          # Detecta e usa o contexto OpenGL escolhido
          self.ctx = mgl.create_context()
          #self.ctx.front_face = "cw"
          self.ctx.enable(flags=mgl.DEPTH_TEST | mgl.CULL_FACE)

          # Cria um objeto para manter a contagem do tempo
          self.clock      = pg.time.Clock()
          self.time       = 0
          self.delta_time = 0

          # Camera
          self.camera     = Camera(self)

          # Coisas
          self.scene      = Cube(self)

     def check_events(self):
          for event in pg.event.get():
               if event.type == pg.QUIT or (event.type == pg.KEYDOWN and event.key == pg.K_ESCAPE):
                    self.scene.destroy()
                    pg.quit()
                    sys.exit()

     def get_time(self):
          self.time = pg.time.get_ticks() * 0.001

     def render(self):
          self.ctx.clear(color=(0, 0, 0))
          self.scene.render()
          pg.display.flip()

     def run(self):
          while True:
               self.get_time()
               self.check_events()
               self.render()
               self.clock.tick(60)
               self.delta_time = self.clock.tick(60)

if __name__ == '__main__':
     game = Engine()
     game.run()

