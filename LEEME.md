# Pantalla en bucle para TV · Divo 3D

Página que corre **sin fin** en un televisor. Divo 3D flota sobre el degradado negro de marca, las
UTMs caen desde arriba pasando por sus lados y él, como un animal con su comida, **las sigue con la
mirada, cierra los ojos y se esfuerza para atraerlas y se las traga**. Si come muchas seguidas
crece, y al terminar se pone feliz y vuelve a su tamaño. Las oleadas se sortean (una, dos, una
ráfaga de 8–15 o una pausa), así que nunca se repite igual.

Cada cierto tiempo Divo se esconde hacia abajo, un círculo revela el video y corre **completo**,
alternando `media/divochat-promocional.mp4` (47 s) y `media/los-divos.mp4` (27 s). Los dos terminan
sobre el fondo oscuro de marca, así que el regreso al degradado no se nota; luego Divo vuelve a subir.

> **Intervalo: 5 minutos** entre videos (`interludeEvery: 300` en `src/main.js`). Para probar sin
> esperar: `index.html?cada=30` o la tecla `V`.

## Enlace público

**https://ricor3412-jpg.github.io/divochat-tv/** · GitHub Pages, repo público
`ricor3412-jpg/divochat-tv` (publicado el 2026-10-01). Desde un enlace web, el navegador pide un
toque ("Toca para iniciar") para permitir el sonido.

**Actualizar:** editar `src/main.js` → `npm run build` → `git add -A; git commit -m "…"; git push`.
Pages se reconstruye solo en 1–2 min. Por `.gitignore` solo se sube lo que la página necesita
(`index.html`, `app.js`, `assets/`, `media/`, `iniciar-tv.bat`, este LEEME); el código fuente y las
herramientas quedan en local. Autor de los commits: `ricor3412-jpg`, sin trailers de coautoría.

## Cómo ponerlo en el TV

**Lo ideal es un computador o mini PC conectado al TV por HDMI.** El navegador de un Smart TV
suele ir corto de potencia para el 3D.

- **Opción 1, recomendada:** doble clic en **`iniciar-tv.bat`**. Abre Chrome en modo kiosco
  (pantalla completa, sin barras) con el sonido de los videos permitido. Para salir: `Alt+F4`.
- **Opción 2:** doble clic en `index.html`, tocar "Toca para iniciar" (el toque desbloquea el sonido
  y pone pantalla completa).

Para que arranque solo al prender el equipo: un acceso directo a `iniciar-tv.bat` en la carpeta de
inicio de Windows (`Win+R` → `shell:startup`).

| Tecla | Acción |
|---|---|
| `V` | Mostrar un video ahora |
| `F` | Pantalla completa |

En la URL: `?cada=30` cambia los segundos entre videos (para probar) y `?autostart` salta la
pantalla de inicio.

## Cambiar algo

Todo está en `src/main.js`. Después de editar, **siempre** `npm run build`: el TV usa `app.js`
(three.js empaquetado, para que funcione sin internet y con doble clic).

| Qué | Dónde (`src/main.js`) |
|---|---|
| Tamaño y altura de Divo | `CFG.divoFrac`, `CFG.divoDrop` |
| Cuánto crece al comer | `CFG.maxGrow` y el `+ 0.055` por bocado |
| Minutos entre videos | `CFG.interludeEvery` (segundos) |
| Videos | `CFG.videos` (archivos en `media/`) |
| Textos de las UTMs | `LABELS` |
| Frecuencia de oleadas y ráfagas | `scheduleWave()` |
| Velocidad de caída | `sp` en `spawnUtm()` |

## Probar sin TV

```powershell
npm run build
node tools/probar.mjs         # ráfaga paso a paso → out/r1…r6.png
node tools/probar-video.mjs   # interludio con los dos videos → out/v1_…, v2_…
```

Las pruebas avanzan la animación paso a paso (`divoDebug.avanzar`), porque el navegador de prueba
no tiene tarjeta gráfica y va lento; en el TV corre a velocidad normal.

## Decisiones

- **Divo nunca se deforma:** crece y late con escala uniforme.
- **Sin desinflado:** se probó un "pfff" con aire por la colita y se descartó porque se veía raro (2026-10-01).
- **Caras en el shader:** normal (parpadea), ojos cerrados al esforzarse y ^ ^ feliz. Usan las
  medidas de los SVG oficiales de `../divo/`.
