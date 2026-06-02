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

    #Métodos:

    #Método Acelerar:
    #"aumento" será o valor recebido para aumentar a velocidade.
    def acelerar(self, aumento):
        # self.velocidade = self.velocidade + aumento
        self.velocidade += aumento

    def frear(self, reducao):
        # self.velocidade = self.velocidade - reducao
        self.velocidade -= reducao
    
    def exibir_info(self, escolha):
        escolha = escolha.lower()
        if escolha == "marca":
            print(f"Marca: {self.marca}")
        elif escolha == "modelo":
            print(f"Modelo: {self.modelo}")
        elif escolha == "ano":
            print(f"Ano: {self.ano}")
        elif escolha == "nome":
            print(f"Nome: {self.nome}")
        elif escolha == "velocidade":
            print(f"Velocidade: {self.velocidade}km/h")
        elif escolha == "todas":
            print(f"marca: {self.marca}, modelo: {self.modelo}, ano: {self.ano}, nome: {self.nome}")
        else:
            print("Opção inválida!")

carro1 = Carro("Ford", "Mustang", "Fastback", 1969, velocidade=0)

# Exibir informações do carro
print(f"\nmarca: {carro1.marca}     |modelo: {carro1.modelo}   |ano: {carro1.ano}     |nome: {carro1.nome}")

carro1.acelerar(int(input("Acelerar: ")))
print(f"{carro1.nome} acelera!\nVelocidade atual:{carro1.velocidade}km/h.")

carro1.frear(int(input("\nFreiar: ")))
print(f"{carro1.nome} freia!\nVelocidade atual:{carro1.velocidade}km/h.")

carro1.exibir_info(input("\nExibir quais informações?\nmarca, modelo, ano, nome, velocidade ou todas?\n"))


carro2 = Carro("BMW", "m3", "e30", 1980, velocidade=0)

print(f"\nmarca: {carro2.marca}      |modelo: {carro2.modelo}        |ano: {carro2.ano}     |nome: {carro2.nome}")

carro2.acelerar(int(input("Acelerar: ")))
print(f"{carro2.nome} acelera!\nVelocidade atual:{carro2.velocidade}km/h.")

carro2.frear(int(input("\nFreiar: ")))
print(f"{carro2.nome} freia!\nVelocidade atual:{carro2.velocidade}km/h.")

carro2.exibir_info(input("\nExibir quais informações?\nmarca, modelo, ano, nome, velocidade ou todas?\n"))