// 작성자 : 김태훈
package com.gdj.cabbage.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj.cabbage.mapper.DirectTradeProductRegistrationMapper;

@Service
public class DirectTradeService {
	
	@Autowired DirectTradeProductRegistrationMapper directTradeProductRegistrationMapper; // 직거래 상품 등록 테이블 접근 맵퍼
	
	// 직거래 상품 리스트
	public List<Map<String, Object>> getDirectTradeProductList(Map<String, Object> map){
		return directTradeProductRegistrationMapper.selectDirectTradeProductList(map);
	}
	
	// 직거래 상품 상세정보
	public Map<String, Object> getDirectTradeProductOne(int directTradeProductRegistrationId){
		return directTradeProductRegistrationMapper.selectDirectTradeProductOneByKey(directTradeProductRegistrationId);
	}
	
	// 직거래 상품 이미지
	public List<String> getDirectTradeProductImg(int directTradeProductRegistrationId){
		return directTradeProductRegistrationMapper.selectDirectTradeProductImgByKey(directTradeProductRegistrationId);
	}
}