// <!-- 작성자 : 강혜란 210708-->
package com.gdj.cabbage.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdj.cabbage.vo.AuctionProductRegistration;

@Mapper
public interface AuctionMapper {

	List<Map<String,Object>> selectAuctionList(Map<String, Object> page);//검색어 없이 auctionList 가져오는 mapper

	int selectAuctionForCount(Map<String, Object> map);//검색어 없이 total 가져오는 mapper

	Map<String, Object> selectAuctionOne(int applyId); //상세정보 가져오는 mapper

	List<Map<String, Object>> selectApplyList(Map<String, Object> page); //건색어 없이 applyList 가져오는 mapper

	int selectApplyForCount(Map<String, Object> paramMap); //검색어 없이 total가져오는 mapper
	
	Map<String, Object> selectApplynOne(int applyId); //상세정보 가져오는 mapper

	int insertAuction(AuctionProductRegistration auctionProductRegistration); //옥션 등록하는 mapper

	void updateConfirmationState(int applyId); //옥션 등록시, confirmation state변경

	

	
	int selectLastBidUserId(Object object); //마지막 옥션 입찰자 찾는 mapper

	int insertBidding(Map<String, Object> map);// 입찰 등록하는 mapper

	int selectNewBidId(Map<String, Object> map); //입찰id를 가져오는 테이블

	
	int insertBidPointPlusHistory(Map<String,Object> map); //포인트 사용을 추가하는 매퍼
	



	
	int selectBeforeBidCnt(Map<String, Object> map); //이전 입찰 갯수를 가져오는 mapper
	int selectBeforeBidId(Map<String, Object> map); //이전 입찰 아이디를 가져오는 mapper
	int selectUserPoint(Map<String, Object> map); //포인트를 가져오는 mapper
	int selectBeforeBidPrice(Map<String, Object> map); //입찰id를 가져오는 매퍼
	int insertBidPointMinusByBid(Map<String, Object> map); //포인트 사용하는 튜플 넣기
	Map<String, Object> selectBeforeBid(Map<String, Object> map); //입찰id를 가져오는 매퍼
	int updateBidding(Map<String, Object> myNewBid); //이전 입찰을 업데이트하는 mapper
	int updateBidPointMinusByBid(Map<String, Object> myNewBid); // 이전 입찰 포인트를 업데이트하는 mapper

}
