package DVMarket;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public aspect AvisoBuscar {
	File file = new File("consultas.log");
	
    pointcut buscar():execution(* *.buscar*(..));

    after() : buscar(){

    	StringBuilder ou = new StringBuilder();
    	ou.append( thisJoinPoint.getSignature().getDeclaringTypeName() + ",");
    	ou.append(Tiempo.fechaDeHoy() + ",");
    	ou.append(Tiempo.horaExacta() + ",");
    	ou.append(thisJoinPoint.getSignature().getName());
    	
        writeFile(ou.toString());
    }

    public void writeFile(String mensaje){
        try {

            String content = mensaje;
            if (!file.exists()) {
                file.createNewFile();
            }

            FileWriter fw = new FileWriter(file.getAbsoluteFile());
            BufferedWriter bw = new BufferedWriter(fw);
            bw.write(content);
            bw.close();

            System.out.println("Done");

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
