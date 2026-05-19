#A calsse "class" é usada para criar uma classe.

#Uma classe funciona como molde para criar objetos.
class Carro:

    # "def" definir uma função ou método.
    # "__int__" é o método construtor da classe.
    # Ele é excluido automaticamente quando um objeto é criado.

    # "self" representa o próprio objeto.

    # "marca", "modelo", "ano", e "velocidade".

    def __init__(self, marca, modelo, nome, ano, velocidade=0):
        self.marca = marca
        self.modelo = modelo
        self.nome = nome
        self.ano = ano
        self.velocidade = velocidade

    def acelerar(self, aumento):
        self.velocidade += self.velocidade + aumento

Fastback = Carro("Ford", "Mustang", "Fastback", 1969, velocidade=0)
# Exibir informações do carro
print(f"marca: {Fastback.marca}     |modelo: {Fastback.modelo}   |ano: {Fastback.ano}     |nome: {Fastback.nome}")
Fastback.acelerar(50)
print(f"{Fastback.nome} acelera! Velocidade atual={Fastback.velocidade}km/h.\n")

e30 = Carro("BMW", "m3", "e30", 1980, velocidade=0)
print(f"marca: {e30.marca}      |modelo: {e30.modelo}        |ano: {e30.ano}     |nome: {e30.nome}")
e30.acelerar(150)
print(f"{e30.nome} acelera! Velocidade atual={Fastback.velocidade}km/h.\n")