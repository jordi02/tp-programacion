#include <stdio.h>


int main ()
{
   //VARIABLES ADICIONALES
    int xUsuario;
    int xClave;
    int rta = 1;
    int expression;
    float depo;
    int contOpe;


   // DECLARACIÓN DE USUARIOS
        // Usuario 1
            int NumUsuario1 = 5000300;
            int ClaveUsuario1 = 2002;
            char NombreUsuario1[] = "Juancito";
            float SaldoUsuario1 = 50000;
            int IntentosUsuario1 = 1;

        // Usuario 2
            int NumUsuario2 = 123456;
            int ClaveUsuario2 = 2005;
            char NombreUsuario2[] = "Carlitos";
            float SaldoUsuario2 = 500000;
            int IntentosUsuario2 = 1;

   // INICIO DE SESION
do
{


    int i = 1;

     do
    {
        printf("Ingrese su Numero de usuario y su clave \n");
        scanf("%d", &xUsuario);
        scanf("%d", &xClave);
        i = i + 1;

        if(((NumUsuario1 != xUsuario) && (ClaveUsuario1 == xClave)) || ((NumUsuario1 == xUsuario) && (ClaveUsuario1 != xClave))){
            IntentosUsuario1 = IntentosUsuario1 + 1;
        };


        if(((NumUsuario2 != xUsuario) && (ClaveUsuario2 == xClave)) || ((NumUsuario2 == xUsuario) && (ClaveUsuario2 != xClave))){
            IntentosUsuario2 = IntentosUsuario2 + 1;
        };


        if (i > 3)
    {
        printf("Ha ingresado su usuario o clave demasiadas veces incorrectamente \n");
        break;
    }
    } 
    while (((xUsuario != NumUsuario1) && (xClave != ClaveUsuario2)) || ((xUsuario != NumUsuario2) && (xClave != ClaveUsuario1)));
   // FIN INICIO SESION

   //HOMEBANK USUARIO 1

    if ((xUsuario == NumUsuario1) && (IntentosUsuario1 <= 4))
    {   
        printf("Hola %s, bienvenido \n", NombreUsuario1 );
        printf("ustedes ingreso en %d intentos \n", IntentosUsuario1);
         for (contOpe = 0; contOpe < 10 ;contOpe++)
        {
            printf("1) Deposito. \n2) Extraccion. \n3) Consultar saldo. \n4) Mostrar la cantidad de operaciones realizadas y el saldo actual. \n5) Salir de su cuenta \n");
            scanf("%d", &expression);
            switch (expression)
            {
             case 1:
                printf("Ingrese cuanto quiere depositar\n");
                scanf("%f", &depo);
                SaldoUsuario1 = SaldoUsuario1 + depo;
                break;

             case 2:
                for (int c = 0; c < 20 ;c++){
                     printf("Ingrese cuanto quiere extraer \n");
                     scanf("%f", &depo);
                      if (depo <= SaldoUsuario1)
                {
                    SaldoUsuario1 = SaldoUsuario1 - depo;
                    break;
                }
                    else{
                        printf("Ingrese un valor valido \n");
                    }
                }
                break;

             case 3:
                printf("Su saldo es de %2.f \n", SaldoUsuario1);
                break;

             case 4:
                printf("Su saldo es de %2.f \n", SaldoUsuario1);
                printf("Sus operaciones fueron %d en total \n", contOpe);
                break;

             case 5:
                printf("Usted va a cerrar sesion \n");
                contOpe = 11;
                break;
            }
        };
    }

    if ((xUsuario == NumUsuario1) && (IntentosUsuario1 > 4)){
        printf("Hola %s, bienvenido \n", NombreUsuario1 );
        printf("No se permiten mas intentos. Su cuenta ha sido bloqueada, comuniquese con la entidad bancaria para su restablecimiento \n");
    };

   //HOMEBANK USUARIO 2

        if ((xUsuario == NumUsuario2) && (IntentosUsuario2 <= 4))
    {   
        printf("Hola %s, bienvenido \n", NombreUsuario2 );
        printf("Usteded ingreso en %d intentos \n", IntentosUsuario2);
         for (contOpe = 0; contOpe < 10 ;contOpe++)
        {
            printf("1) Deposito. \n2) Extraccion. \n3) Consultar saldo. \n4) Mostrar la cantidad de operaciones realizadas y el saldo actual. \n5) Salir de su cuenta \n");
            scanf("%d", &expression);
            switch (expression)
            {
             case 1:
                printf("Ingrese cuanto quiere depositar\n");
                scanf("%f", &depo);
                SaldoUsuario2 = SaldoUsuario2 + depo;
                break;

             case 2:
                for (int c = 0; c < 20 ;c++){
                     printf("Ingrese cuanto quiere extraer \n");
                     scanf("%f", &depo);
                      if (depo <= SaldoUsuario2)
                {
                    SaldoUsuario2 = SaldoUsuario2 - depo;
                    break;
                }
                    else{
                        printf("Ingrese un valor valido \n");
                    }
                }
                break;

             case 3:
                printf("Su saldo es de %2.f \n", SaldoUsuario2);
                break;

             case 4:
                printf("Su saldo es de %2.f \n", SaldoUsuario2);
                printf("Sus operaciones fueron %d en total \n", contOpe);
                break;

             case 5:
                printf("Usted va a cerrar sesion \n");
                contOpe = 11;
                break;
            }
        };
    }
    if((xUsuario == NumUsuario2) && (IntentosUsuario2 > 4)){
        printf("Hola %s, bienvenido \n", NombreUsuario2 );
        printf("No se permiten mas intentos. Su cuenta ha sido bloqueada, comuniquese con la entidad bancaria para su restablecimiento \n");
    };

    printf("Se va a reiniciar el programa \n");



} while (rta == 1);

    return 0;
    
}