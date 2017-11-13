package com;

public class Log {
	private int OID;
	private String Operation;
	private String Otype;
	private String Time;
	
	public void setOID(int OID){
		this.OID=OID;
	}
	
	public int getOID(){
		return OID;
	}
	
	public void setOperation(String Operation){
		this.Operation=Operation;
	}
	
	public String getOperation(){
		return Operation;
	}
	
	public void setOtype(String Otype){
		this.Otype=Otype;
	}
	
	public String getOtype(){
		return Otype;
	}
	
	public void setTime(String Time){
		this.Time=Time;
	}
	
	public String getTime(){
		return Time;
	}
}
