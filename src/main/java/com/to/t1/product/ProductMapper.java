package com.to.t1.product;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ProductMapper {

	// 상품 등록
	public int proInsert(ProductVO productVO)throws Exception;

	// 상품 이미지 등록
	public int fileInsert(ProfilesVO profilesVO)throws Exception;
	
	// 상품 선택
	public ProductVO proSelect(ProductVO productVO)throws Exception;

	// 상품 전체 리스트
	public List<ProductVO> proList(ProductVO productVO)throws Exception;
	
	// 상품 이미지 가져오기
	public ProfilesVO fileSelect(ProfilesVO profilesVO)throws Exception;
	
	// 상품 이미지 삭제
	public int fileDelete(ProfilesVO profilesVO)throws Exception;
	
	// 상품 업데이트
	public int proUpdate(ProductVO productVO)throws Exception;
	
	// 상품 삭제
	public int proDelete(ProductVO productVO)throws Exception;
	
	// 상품 검색
	public List<ProductVO> proSearch(@Param("productVO") ProductVO productVO)throws Exception;
	
	// 상품 카테고리 리스트
	public List<ProductVO> proAppliances(ProductVO productVO)throws Exception;
	public List<ProductVO> proClothing(ProductVO productVO)throws Exception;
	public List<ProductVO> proNecessity(ProductVO productVO)throws Exception;
	public List<ProductVO> proMerchandise(ProductVO productVO)throws Exception;
	public List<ProductVO> proFood(ProductVO productVO)throws Exception;
	
	// 상품 카테고리 선택
	public ProductVO cateSelect(ProductVO productVO)throws Exception;
	
	
}
