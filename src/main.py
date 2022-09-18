import pygame   as pg
import moderngl as mgl

import sys

class Engine:
     def __init__(self, win_size=(1080, 640)):
          # Inicia o pygame
          pg.init()

          # Estabelece o tamanho da janela
          self.WIN_SIZE = win_size

          # Estabelece os atributos do contexto OpenGL
          pg.display.gl_set_attribute(pg.GL_CONTEXT_MAJOR_VERSION, 3)
          pg.display.gl_set_attribute(pg.GL_CONTEXT_MINOR_VERSION, 3)
          pg.display.gl_set_attribute(pg.GL_CONTEXT_PROFILE_MASK, pg.GL_CONTEXT_PROFILE_CORE)

          # Cria o contexto OpenGL
          pg.display.set_mode(self.WIN_SIZE, flags=pg.OPENGL | pg.DOUBLEBUF)

          # Configura o mouse
          # pg.event.set_grab(True)
          # pg.mouse.set_visible(False)

          # Detecta e usa o contexto OpenGL escolhido
          self.ctx = mgl.create_context()

          # Cria um objeto para manter a contagem do tempo
          self.clock      = pg.time.Clock()
          self.time       = 0
          self.delta_time = 0

     def check_events(self):
          for event in pg.event.get():
               if event.type == pg.QUIT or (event.type == pg.KEYDOWN and event.key == pg.K_ESCAPE):
                    self.mesh.destroy()
                    pg.quit()
                    sys.exit()

     def render(self):
          self.ctx.clear(color=(0.08, 0.16, 0.18))
          pg.display.flip()

     def run(self):
          while True:
               self.check_events()
               self.render()
               self.clock.tick(60)

if __name__ == '__main__':
     app = Engine()
     app.run()

