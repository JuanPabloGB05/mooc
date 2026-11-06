<?php
require_once __DIR__ . '/classes/Libro.php';

$libros = [
    new Libro('El Quijote', 'Cervantes', 1605, '978-8420412146'),
    new Libro('Cien años de soledad', 'García Márquez', 1967, '978-0307474728'),
    new Libro('1984', 'Orwell', 1949, '978-0451524935'),
];

foreach ($libros as $libro) {
    echo $libro->mostrarFicha(), '<br>';
}