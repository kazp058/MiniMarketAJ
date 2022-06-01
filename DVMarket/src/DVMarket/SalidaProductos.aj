package DVMarket;

public aspect SalidaProductos {
	File file = new File("market.log");
    /*Calendar cal = Calendar.getInstance();
    pointcut transaction():execution(void Bank.make*(..));
    pointcut money():execution(void Bank.my*(..));
    pointcut user():execution(void Bank.create*(..));*/

    after() : callborrarItem(){
        writeFile(Tiempo.getfechadehoy());
        writeFile(Tiempo.gethoraexacta());
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
	 /*pointcut callborrarItem(): call(void DVMarket.borrarItem()); 
	 
	 after() : callborrarItem() {
		 Tiempo.fechaDeHoy();
		 Tiempo.horaExacta();
		 
		 System.out.println("After call sayHello");
	 }
	 
	 pointcut calleliminarProductos() : call(boolean DVMarket.eliminarProductos());
	 
	 after() : calleliminarProductos(){*/
		 
	 }

}
