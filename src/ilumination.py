import glm

class Phong_Light:
     def __init__(self, position=(3, 3, 3), color=(1, 1, 1)):
          # Posição e cor do ponto de luz
          self.position = glm.vec3(position)
          self.color    = glm.vec3(color)

          # Intensidades do ponto de luz
          self.Ia = 0.1 * self.color # Ambiente
          self.Id = 0.8 * self.color # Difusa
          self.Is = 1.0 * self.color # Specular
