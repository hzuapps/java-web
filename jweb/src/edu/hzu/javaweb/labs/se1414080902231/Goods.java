package edu.hzu.javaweb.labs.se1414080902231;

public class Goods {
	
		private String gN,dT,img;
		Goods(String gN,String dT,String img)
		{
			this.gN=gN;
			this.dT=dT;
			this.img=img;
		}
		
		public String getgN()
		{
			return gN;
		}
		
		public String getdT()
		{
			return dT;
		}
		
		public String getimg()
		{
			return img;
		}

}
