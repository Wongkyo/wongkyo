package com.to.t1.product;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.to.t1.util.Criteria;

@Mapper
public interface ProductMapper {

	// 상품 등록
	public int proInsert(ProductVO productVO)throws Exception;

	// 상품 이미지 등록
	public int fileInsert(ProfilesVO profilesVO)throws Exception;
	
	// 상품 선택
	public ProductVO proSelect(ProductVO productVO)throws Exception;

	// 상품 전체 리스트
	public List<Map<String, Object>> proList(Criteria cri) throws Exception;
	 
	// 전체 상품 리스트의 갯수
	public int proListCnt() throws Exception;

	// 상품 카테고리 리스트	
	// 가전 제품
	public List<ProductVO> proAppliances(ProductVO productVO)throws Exception;
	// 의류
	public List<ProductVO> proClothing(ProductVO productVO)throws Exception;
	// 생필품
	public List<ProductVO> proNecessity(ProductVO productVO)throws Exception;
	// 잡화
	public List<ProductVO> proMerchandise(ProductVO productVO)throws Exception;
	// 음식 
	public List<ProductVO> proFood(ProductVO productVO)throws Exception;
	
	// 상품 이미지 가져오기
	public ProfilesVO fileSelect(ProfilesVO profilesVO)throws Exception;
	
	// 상품 이미지 삭제
	public int fileDelete(ProfilesVO profilesVO)throws Exception;
	
	// 상품 업데이트
	public int proUpdate(ProductVO productVO)throws Exception;
	
	// 상품 삭제
	public int proDelete(ProductVO productVO)throws Exception;
	
	// 상품 검색(미구현)
	public List<ProductVO> proSearch(@Param("productVO") ProductVO productVO)throws Exception;

	// 상품 카테고리 선택
	public ProductVO cateSelect(ProductVO productVO)throws Exception;
	
	
}
