package com.to.t1.product;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


import com.to.t1.util.PoFileManager;

@Service
public class ProductService {

	// ProductMapper 주입
	@Autowired
	private ProductMapper productMapper;

	// 파일매니저 주입	
	@Autowired
	private PoFileManager poFileManager;

	
	public List<ProductVO> proSearch(ProductVO productVO) throws Exception{
		return productMapper.proSearch(productVO);
	}
	
	// 상품 업데이트
	public int proUpdate(ProductVO productVO)throws Exception{
		return productMapper.proUpdate(productVO);
	}

	// 상품 삭제
	public int proDelete(ProductVO productVO)throws Exception{
		return productMapper.proDelete(productVO);
	}
	
	// 상품 선택
	public ProductVO proSelect(ProductVO productVO)throws Exception{
		return productMapper.proSelect(productVO);
	}
	
	// 상품 리스트 
	public List<ProductVO> proList(ProductVO productVO)throws Exception{
		return productMapper.proList(productVO);
	}
	
	// 상품 카테고리 리스트
	public List<ProductVO> proAppliances(ProductVO productVO)throws Exception{
		return productMapper.proAppliances(productVO);
	}
	
	public List<ProductVO> proClothing(ProductVO productVO)throws Exception{
		return productMapper.proAppliances(productVO);
	}
	
	public List<ProductVO> proNecessity(ProductVO productVO)throws Exception{
		return productMapper.proAppliances(productVO);
	}
	
	public List<ProductVO> proMerchandise(ProductVO productVO)throws Exception{
		return productMapper.proAppliances(productVO);
	}
	
	public List<ProductVO> proFood(ProductVO productVO)throws Exception{
		return productMapper.proAppliances(productVO);
	}
	
	// 상품 등록
	public int proInsert(ProductVO productVO, MultipartFile avatar, HttpSession session)throws Exception{		
		String fileName = poFileManager.save("product", avatar, session);		
		ProfilesVO profilesVO = new ProfilesVO();
		profilesVO.setProNum(productVO.getProNum());
		profilesVO.setOriName(avatar.getOriginalFilename());
		profilesVO.setFileName(fileName);		
		int result = productMapper.proInsert(productVO);
		result = productMapper.fileInsert(profilesVO);		
		return result;		
	}
		
	// 상품 카테고리 선택
	public ProductVO cateSelect(ProductVO productVO)throws Exception{
		return productMapper.cateSelect(productVO);
	}
	
}
