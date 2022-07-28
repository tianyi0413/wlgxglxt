package com.mapper;

import java.util.List;
import java.util.Map;

import com.model.Company;

public interface CompanyMapper {
	public List<Company> findCompanyList();
	
	public List<Company> query(Map<String,Object> inputParam);
	
	int getCount(Map<String,Object> inputParam);
	
	public int insertCompany(Company company);
	
	public int deleteCompany(int id);
	
	public int updateCompany(Company company);
	
	public Company queryCompanyById(int id);
	
 
	
	
}
