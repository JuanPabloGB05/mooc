<?php
// includes/auth.php — VERSIÓN STUB (se completará en el Bloque 2)

session_start();

/**
 * Intenta iniciar sesión.
 * TODO: En el Bloque 2 conectaremos con la BBDD.
 * Por ahora siempre devuelve false para poder probar el formulario.
 */
function login(string $email, string $pass): bool {
    // TODO: implementar en Bloque 2
    return false;
}

/**
 * Devuelve el usuario logueado, o null si no hay sesión.
 */
function currentUser(): ?array {
    return $_SESSION['user'] ?? null;
}