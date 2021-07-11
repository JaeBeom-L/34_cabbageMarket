// <!-- 작성자 : 강혜란 210708-->
package com.gdj.cabbage.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AuctionMapper {

	List<Map<String,Object>> selectAuctionList(Map<String, Object> page);//검색어 없이 auctionList 가져오는 mapper

	int selectAuctionForCount();//검색어 없이 total 가져오는 mapper

	Map<String, Object> selectAuctionOne(int applyId); //상세정보 가져오는 mapper

	List<String> selectAuctionImgByKey(int applyId); //상세 이미지 가져오는 mapper

	List<Map<String, Object>> selectApplyList(Map<String, Object> page); //건색어 없이 applyList 가져오는 mapper

	int selectApplyForCount(Map<String, Object> paramMap); //검색어 없이 total가져오는 mapper

}
