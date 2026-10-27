<?php
require_once __DIR__ . '/classes/Libro.php';

$l = new Libro('El Quijote', 'Cervantes', 1605, '978-8420412146');
echo $l->mostrarFicha(), PHP_EOL;
echo '¿Disponible? ', $l->isDisponible() ? 'sí' : 'no', PHP_EOL;
echo 'Tipo: ', $l->tipoMaterial(), PHP_EOL;