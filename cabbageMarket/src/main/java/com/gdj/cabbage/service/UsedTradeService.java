package com.gdj.cabbage.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdj.cabbage.mapper.CategoryMapper;
import com.gdj.cabbage.mapper.UsedTradeMapper;
import com.gdj.cabbage.vo.ProductConfirmationRegistration;
import com.gdj.cabbage.vo.UsedProductRegistration;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional
public class UsedTradeService {
	@Autowired
	UsedTradeMapper usedTradeMapper;

	// 중고상품 목록
	public List<Map<String, Object>> getUsedProductList(Map<String, Object> map) {
		log.debug("map " + map);
		return usedTradeMapper.selectUsedProductList(map);
	}

	// 중고상품 total
	public int getUsedProductTotal(Map<String, Object> map) {
		return usedTradeMapper.selectUsedProductTotal(map);
	}
	
	//중고상품 상세 details
	public Map<String,Object> getUsedProductOne(int applyId){
		log.debug("★★★★★★★★service getUsedProductOne() applyId:" + applyId);
		return usedTradeMapper.selectUsedProductOne(applyId);
	}
	
	//중고상품 상세 img
	public List<String> getUsedProductImg(int applyProductSalesDeliveryId){
		return usedTradeMapper.selectUsedProductImg(applyProductSalesDeliveryId);
	}
	
	//중고상품 등록
	public void addUsedProduct(UsedProductRegistration usedProductRegistration, ProductConfirmationRegistration productConfirmationRegistration) {
		usedTradeMapper.insertUsedProduct(usedProductRegistration); //중고상품 등록
		usedTradeMapper.updateProductRegistrationState(productConfirmationRegistration); //상태값 변경(미등록->중고상품)
	}
	
	//중고상품 수정
	public void modifyUsedProduct(UsedProductRegistration usedProductRegistration) {
		usedTradeMapper.updateUsedProduct(usedProductRegistration);
	}
	
}