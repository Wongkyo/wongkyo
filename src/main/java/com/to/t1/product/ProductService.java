package com.to.t1.product;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import com.to.t1.util.Criteria;
import com.to.t1.util.PoFileManager;

@Service
public class ProductService {

	// ProductMapper 주입
	@Autowired
	private ProductMapper productMapper;

	// 파일매니저 주입	
	@Autowired
	private PoFileManager poFileManager;

	// 상품 검색
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
	
	// 전체 상품 리스트
	 public List<Map<String, Object>> proList(Criteria cri) throws Exception {
	     return productMapper.proList(cri);
	}

	 // 전체 상품 갯수
	 public int proListCnt() throws Exception {
		 return productMapper.proListCnt();
	 }
	 
	// 상품 (전자) 리스트
	public List<ProductVO> proAppliances(ProductVO productVO)throws Exception{
		return productMapper.proAppliances(productVO);
	}
	
	// 상품 (의류) 리스트
	public List<ProductVO> proClothing(ProductVO productVO)throws Exception{
		return productMapper.proClothing(productVO);
	}
	
	// 상품 (생필품) 리스트
	public List<ProductVO> proNecessity(ProductVO productVO)throws Exception{
		return productMapper.proNecessity(productVO);
	}
	
	// 상품 (잡화) 리스트
	public List<ProductVO> proMerchandise(ProductVO productVO)throws Exception{
		return productMapper.proMerchandise(productVO);
	}
	
	// 상품 (음식) 리스트
	public List<ProductVO> proFood(ProductVO productVO)throws Exception{
		return productMapper.proFood(productVO);
	}
	
	// 상품 등록
	public int proInsert(ProductVO productVO, MultipartFile avatar, HttpSession session)throws Exception{		
		// 파일네임 설정
		String fileName = poFileManager.save("product", avatar, session);		
		// profilesVO 파라미터 생성
		ProfilesVO profilesVO = new ProfilesVO();
		// profilesVO에 productVO의 proNum 주입
		profilesVO.setProNum(productVO.getProNum());
		// profilesVO에 oriName 주입
		profilesVO.setOriName(avatar.getOriginalFilename());
		// profilesVOd에 fileName 생성
		profilesVO.setFileName(fileName);		
		// proInsert 매퍼문 가져오기
		int result = productMapper.proInsert(productVO);
		// result에 profiles 주입
		result = productMapper.fileInsert(profilesVO);		
		// 결과값 리턴
		return result;		
	}
		
	// 상품 카테고리 선택
	public ProductVO cateSelect(ProductVO productVO)throws Exception{
		return productMapper.cateSelect(productVO);
	}
	
}
