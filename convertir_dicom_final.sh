#!/bin/bash

# Convert image .DICOM to .png
# Install in archlinux pkg:
# yay -S dcmtk imagemagick   

# Habilitar el modo de depuración
set -x

# Comprobar si ImageMagick está instalado
if ! command -v magick &> /dev/null; then
    echo "Error: ImageMagick no está instalado. Por favor, instálalo con 'sudo pacman -S imagemagick'"
    exit 1
fi

# Directorio principal donde se encuentran las imágenes DICOM
DICOM_DIR="$HOME/Documentos/DICOM"

# Directorio donde se guardarán las imágenes convertidas
OUTPUT_DIR="$HOME/dicom"

# Crear el directorio de salida si no existe
mkdir -p "$OUTPUT_DIR"

# Función para convertir un archivo DICOM a PNG
convertir_dicom() {
    local archivo="$1"
    local directorio_salida="$2"
    local nombre_base=$(basename "$archivo")
    local ruta_relativa="${archivo#$DICOM_DIR/}"
    local directorio_destino="$directorio_salida/$(dirname "$ruta_relativa")"

    echo "Procesando archivo: $archivo"
    echo "Directorio destino: $directorio_destino"

    mkdir -p "$directorio_destino"

    # Comprobar si el archivo es realmente un archivo DICOM
    if file "$archivo" | grep -q "DICOM"; then
        # Intentar diferentes métodos de conversión
        if dcmj2pnm +on2 "$archivo" "$directorio_destino/$nombre_base.ppm"; then
            if magick "$directorio_destino/$nombre_base.ppm" -normalize -contrast-stretch 2%x98% -depth 8 "$directorio_destino/$nombre_base.png"; then
                rm "$directorio_destino/$nombre_base.ppm"
                echo "Convertido: $archivo -> $directorio_destino/$nombre_base.png"
                return 0
            else
                echo "Error al convertir PPM a PNG: $archivo"
                return 1
            fi
        else
            echo "Error al convertir DICOM a PPM: $archivo"
            return 1
        fi
    else
        echo "El archivo no parece ser un archivo DICOM válido: $archivo"
        return 1
    fi
}

# Verificar si el directorio DICOM existe
if [ ! -d "$DICOM_DIR" ]; then
    echo "Error: El directorio $DICOM_DIR no existe."
    exit 1
fi

echo "Buscando archivos DICOM en $DICOM_DIR..."

# Contador para archivos procesados
archivos_procesados=0
archivos_convertidos=0

# Buscar y convertir todos los archivos en los subdirectorios
find "$DICOM_DIR" -type f | while read -r archivo; do
    ((archivos_procesados++))
    if convertir_dicom "$archivo" "$OUTPUT_DIR"; then
        ((archivos_convertidos++))
    fi
done

echo "Proceso completado."
echo "Archivos procesados: $archivos_procesados"
echo "Archivos convertidos exitosamente: $archivos_convertidos"

if [ $archivos_convertidos -eq 0 ]; then
    echo "ADVERTENCIA: No se convirtió ningún archivo. Verifica que haya archivos DICOM válidos en $DICOM_DIR"
fi
