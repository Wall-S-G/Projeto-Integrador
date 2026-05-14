#A calsse "class" é usada para criar uma classe.

#Uma classe funciona como molde para criar objetos.
class Carro:

    # "def" definir uma função ou método.
    # "__int__" é o método construtor da classe.
    # Ele é excluido automaticamente quando um objeto é criado.

    # "self" representa o próprio objeto.

    # "marca", "modelo", "ano", e "velocidade".

    def__init__(self, marca, modelo, ano, velocidade=0):
        self.marca = marca
        self.modelo = modelo
        self.ano = ano
        self.velocidade = velocidade

    carro1 = Carro("Ford", "Mustang", 1969)
    
    # Exibir informações do carro
    print(f"marca: {self.marca}")