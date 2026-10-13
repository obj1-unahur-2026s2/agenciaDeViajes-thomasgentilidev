class PacksDeViajes
{   
    const beneficios = []
    const duracionEnDias 
    const precioBase 
    const cordinadorACargo = ninguno

    method packEsPremium()

    method precioBase() = precioBase

    method valorFinal() = (precioBase + beneficios.sum({p => p.costo()}))

    method aniadirBeneficio(unBeneficio)
    {
        beneficios.add(unBeneficio)
    }
}

class PacksNacionales inherits PacksDeViajes
{
    const actividadesIncluidas = []
    const provinciaDeDestino 

    override method packEsPremium() =
    duracionEnDias > 10
    &&
    cordinadorACargo.estaAltamenteCapacitado()


}

class PacksInternacionales inherits PacksDeViajes
{
    const paisDestino
    const cantidadDeEscalas 
    const esLugarDeInteres // booleano

    override method packEsPremium() =
    esLugarDeInteres
    &&
    duracionEnDias > 20
    &&
    cantidadDeEscalas == 0

    override method valorFinal() = super() + super() * 0.2

}

class Cordinador
{
    var rol = guia
    const roles = [guia , asistenteLogistico, acompaniante]
    const cantidadDeViajes
    const estaMotivado //booleano
    const aniosDeExperiencia

    method estaMotivado() = estaMotivado
    method aniosDeExperiencia() = aniosDeExperiencia 

    method cambiarDeRol(unRol)
    {
        if (roles.contains(unRol))
        {
            rol = unRol
        }
        else
        {
            self.error("No existe ese rol actualmente")
        }
    }

    method estaAltamenteCapacitado() =
    cantidadDeViajes > 20 
    &&
    rol.cumpleElRequisito(self)
}

class BeneficiosEspeciales
{
 const tipoDeBeneficio
 const costo 
 const estaVigente   

 method costo() = costo

}

class PacksProvinciales inherits PacksNacionales
{
    const cantidadDeCiudadesAVisitar = 0

    override method packEsPremium() =
    actividadesIncluidas.size() >= 4
    &&
    cantidadDeCiudadesAVisitar > 5
    &&
    beneficios.filter({p => p.estaVigente(true)}).size() >= 3

    override method valorFinal() = 
    if (self.packEsPremium()) super() + super() * 0.05
    else super()

    
}


object guia
{

    method cumpleElRequisito(unGuia) = unGuia.estaMotivado()

}

object asistenteLogistico
{
    method cumpleElRequisito(unGuia) = unGuia.aniosDeExperiencia() >= 3
}

object acompaniante
{
    method cumpleElRequisito(unGuia) = true
}

object ninguno{}