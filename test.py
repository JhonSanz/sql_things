class Vertebrado:
    animal_type = "vertebrado"

    def __init__(self, name, age):
        self._name = name
        self._age = age

    @property
    def name(self):
        return self._name

    @name.setter
    def name(self, name):
        self._name = name

    @property
    def age(self):
        return self._age

    @age.setter
    def age(self, age):
        self._age = age

    @staticmethod
    def animal_type_info():
        print("Este es un ser vivo", Vertebrado.animal_type)

    def get_taxonomy(self):
        print("Perteneciente a la familia", self.animal_type)


class Dog(Vertebrado):
    animal_type = "mamífero"

    def __init__(self, name, age, breed):
        super().__init__(name, age)
        self._breed = breed

    @property
    def breed(self):
        return self._breed

    @breed.setter
    def breed(self, breed):
        self._breed = breed


my_dog = Dog("Firulais", 3, "Pastor alemán")

print("Nombre del perro:", my_dog.name)
print("Edad del perro:", my_dog.age)
print("Raza del perro:", my_dog.breed)

my_dog.name = "Max"
print("Nuevo nombre del perro:", my_dog.name)

my_dog.animal_type_info()
my_dog.get_taxonomy()
