package DVMarket;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public aspect SalidaProductos {
	File file = new File("market.log");

    before(Item item) : target(item) && call(* DVMarket.borrarItem(..)){
        System.out.println("hollaaa");

    	StringBuilder ou = new StringBuilder();
    	
    	ou.append("borrarItem,");
    	ou.append(item.getNombre() + ",");
    	ou.append(Tiempo.fechaDeHoy() + ",");
    	ou.append(Tiempo.horaExacta());
    	
        writeFile(ou.toString());
        
        System.out.println("hollaaa");
    }
    

    public void writeFile(String mensaje){
        try {

            String content = mensaje;
            // if file doesnt exists, then create it
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
