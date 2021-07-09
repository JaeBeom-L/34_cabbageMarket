
package com.gdj.cabbage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdj.cabbage.Debuging;
import com.gdj.cabbage.mapper.AuctionMapper;
import com.gdj.cabbage.mapper.CategoryMapper;
import com.gdj.cabbage.vo.CategoryMain;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class AuctionService {
	@Autowired AuctionMapper auctionMapper;
	@Autowired CategoryMapper categoryMapper;

	public Map<String, Object> getAuctionList(Map<String, Object> paramMap) {//경매상품과 검색어에따른 total, lastPage, auctionList가져오는 서비스
		log.debug(Debuging.DEBUG+"2 controller에서 보낸 paramMap확인"+paramMap.toString());
		
		int beginRow = (((int)paramMap.get("currentPage")-1)*(int)paramMap.get("rowPerPage"));
		int total = (auctionMapper.selectAuctionForCount()); //검색어 없이 total 가져오는 mapper
		int lastPage = (int)(Math.ceil((double)total / (int)paramMap.get("rowPerPage"))); //lastPage 계산
		
		Map<String,Object> page = new HashMap<String,Object>();
		page.put("beginRow", beginRow);
		page.put("RowPerPage", ((int)paramMap.get("rowPerPage")));
		page.put("SearchWord", ((String)paramMap.get("searchWord")));
		log.debug(Debuging.DEBUG+"3 mapper로 보낼 Page 학인 : "+ page.toString());
		
		log.debug(Debuging.DEBUG+"4 mapper에서 온 total 확인: "+ total);
		List<Map<String,Object>> auctionList = auctionMapper.selectAuctionList(page); //검색어 없이 auctionList 가져오는 mapper
		log.debug(Debuging.DEBUG+"4 mapper에서 보낸 auctionList 확인"+auctionList.toString());
		
		List<CategoryMain> categoryMainList = categoryMapper.selectCategoryMain();//카테고리 메인을 불러오는 mapper
		log.debug(Debuging.DEBUG+"4 mapper에서 보낸 categoryMainList확인"+categoryMainList.toString());
		
		Map<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("total", total);
		resultMap.put("lastPage", lastPage);
		resultMap.put("auctionList", auctionList);
		resultMap.put("categoryMainList", categoryMainList);
		
		return resultMap;
	}

}