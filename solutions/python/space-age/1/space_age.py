from enum import Enum


class FromEarthTo(Enum):
    Mercury = 0.2408467
    Venus = 0.61519726
    Earth = 1.0
    Mars = 1.8808158
    Jupiter = 11.862615
    Saturn = 29.447498
    Uranus = 84.016846
    Neptune = 164.79132


class SpaceAge:
    __seconds_in_earth_year = 31557600

    def __init__(self, seconds):
        self._seconds = seconds
        self.__on_earth = self._seconds / self.__seconds_in_earth_year

    def __to_planet(self, planet_ratio: FromEarthTo, precision: int):
        return round(self.__on_earth / planet_ratio.value, precision)

    def on_mercury(self):
        return self.__to_planet(FromEarthTo.Mercury, 2)

    def on_venus(self):
        return self.__to_planet(FromEarthTo.Venus, 2)

    def on_earth(self):
        return self.__to_planet(FromEarthTo.Earth, 2)

    def on_mars(self):
        return self.__to_planet(FromEarthTo.Mars, 2)

    def on_jupiter(self):
        return self.__to_planet(FromEarthTo.Jupiter, 2)

    def on_saturn(self):
        return self.__to_planet(FromEarthTo.Saturn, 2)

    def on_uranus(self):
        return self.__to_planet(FromEarthTo.Uranus, 2)

    def on_neptune(self):
        return self.__to_planet(FromEarthTo.Neptune, 2)
