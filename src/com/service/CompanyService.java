package com.service;
import java.util.List;

import com.model.Company;
import com.util.PageBean;

public interface CompanyService
{
    public List<Company> queryCompanyList(Company company,PageBean page) throws Exception;
 
	public int insertCompany(Company company) throws Exception ;
	
	public int deleteCompany(int id) throws Exception ;
	
	public int updateCompany(Company company) throws Exception ;
	
	public Company queryCompanyById(int id) throws Exception ;
	
	int getCount(Company company);
	

}
