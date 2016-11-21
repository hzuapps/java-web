package com.dao;
import java.util.List;
import com.domain.Szt_information;
public interface Iszt_informationDAO {
	public abstract Szt_information create(Szt_information szt) throws Exception;
	public abstract void remove(Szt_information szt) throws Exception;
	public abstract Szt_information find(Szt_information szt) throws Exception;
	public abstract List<Szt_information> findAll() throws Exception;
	public abstract void update(Szt_information szt) throws Exception;
	
	
}
