# Proyecto Flutter para Prueba Técnica en Tyba (Front Engineer)

Este es un proyecto de ejemplo desarrollado en Flutter como parte de una prueba técnica. El propósito del proyecto es demostrar mis habilidades en el desarrollo de aplicaciones móviles utilizando Flutter.

## Tabla de Contenidos
- [Descripción](#descripción)
- [Requisitos](#requisitos)
- [Estructura del Proyecto](#estructura-del-proyecto)

## Descripción
La aplicación muestra un listado de pokemones sobre los cuales se pueden ver sus detalles, además la aplicación cuenta con un filtro persistente de búsqueda basado en sus habilidades.

## Requisitos
- Elegir un API de interés (API Pokemons).
- Visualizar los datos de la API.
- Crear una vista de detalles de cada ítem con una animación Hero.
- Filtrar datos y persistir la información de los filtros al cerrar y abrir la aplicación.
- Desde la vista de detalles navegar a una página externa para buscar más info sobre el ítem.

## Estructura
```plaintext
lib/
│
├── main.dart            # Punto de entrada de la aplicación
├── src.dart             # Código fuente de la aplicación
├──── app/               # Configuración de la navegación de la aplicación
├──── configs/           # Configuraciones generales de funcionalidades requeridas a lo largo de la aplicación
├──── feature/           # Características principales de la aplicación
├──────── home/          # Vista inicial de la aplicación (Pokemons)
├──────── details/       # Vista de detalles de cada Pokemons
├──── shared/            # Widgets reutilizables que son compartidos a lo largo de la aplicación
└──── utilities/         # Utilidades generales usadas para toda la aplicación