package com.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.CompanyMapper;
import com.model.Company;
import com.util.PageBean;
@Service
public class CompanyServiceImpl implements CompanyService
{
        
    @Autowired
	private CompanyMapper companyMapper;


	public List<Company> queryCompanyList(Company company,PageBean page) throws Exception {
		Map<String, Object> map = getQueryMap(company, page);
		
		List<Company> getCompany = companyMapper.query(map);
		return getCompany;
	}
	
	@Override
	public int getCount(Company company) {
		Map<String, Object> map = getQueryMap(company, null);
		int count = companyMapper.getCount(map);
		return count;
	}
	
	private Map<String, Object> getQueryMap(Company company,PageBean page){
		Map<String, Object> map = new HashMap<String, Object>();
		if(company!=null){
			map.put("id", company.getId());
			
		}
		PageBean.setPageMap(map, page);
		return map;
	}

	public int insertCompany(Company company) throws Exception {
		
		return companyMapper.insertCompany(company);
	}

	public int deleteCompany(int id) throws Exception {
		return companyMapper.deleteCompany(id);
	}

	public int updateCompany(Company company) throws Exception {
		return companyMapper.updateCompany(company);
	}
	
	public Company queryCompanyById(int id) throws Exception {
		return companyMapper.queryCompanyById(id);
	}
	

	
	
	
	
 
}
