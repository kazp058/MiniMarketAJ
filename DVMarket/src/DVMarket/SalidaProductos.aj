package DVMarket;

public aspect SalidaProductos {
	 pointcut callborrarItem(): call(void DVMarket.borrarItem()); 
	 
	 after() : callborrarItem() {
		 Tiempo.fechaDeHoy();
		 Tiempo.horaExacta();
		 
		 System.out.println("After call sayHello");
	 }
	 
	 pointcut calleliminarProductos() : call(boolean DVMarket.eliminarProductos());
	 
	 after() : calleliminarProductos(){
		 
	 }

}
