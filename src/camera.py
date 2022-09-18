import glm

FOV  = 50 # graus
NEAR = 0.1
FAR  = 100

class Camera:
     def __init__(self, game):
          self.game         = game
          self.aspect_ratio = game.WIN_SIZE[0] / game.WIN_SIZE[1]
          self.position     = glm.vec3(2, 3, 3)
          self.up           = glm.vec3(0, 1, 0)

          # Matriz de visão
          self.view_m       = self.get_view_matrix()

          # Matriz de projeção
          self.proj_m       = self.get_projection_matrix()

     def get_view_matrix(self):
          return glm.lookAt(self.position, glm.vec3(0), self.up)

     def get_projection_matrix(self):
          return glm.perspective(glm.radians(FOV), self.aspect_ratio, NEAR, FAR)

