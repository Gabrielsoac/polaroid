export const createPolaroidOptions = (photoPath, polaroidPath) =>  {
    return [
    "(",
    photoPath,
    "-background", "white",
    "-gravity", "center",
    "-resize", "270x370>",        
    "-extent", "300x400",
    ")",
    "(",
    "+clone",
    "-background", "none",
    ")",
    "+swap",
    "-background", "white",
    "-gravity", "south",
    "-splice", "0x60",
    "-flatten", 
    polaroidPath
]}