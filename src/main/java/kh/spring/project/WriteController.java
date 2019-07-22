package kh.spring.project;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kh.spring.dto.Auction_boardDTO;
import kh.spring.dto.Auction_img_boardDTO;
import kh.spring.dto.Used_transaction_boardDTO;
import kh.spring.dto.Used_transaction_img_boardDTO;
import kh.spring.service.WriteService;

@Controller
public class WriteController {


   @Autowired
   private WriteService sv;
   @Autowired
   private HttpSession session;
   @Autowired
   private TradeController tc;
   
   
   @RequestMapping("tradeGoodsWrite")
   public String write() {
      return "goodsTradeWrite";
   } //중고 글쓰기로 가기

   @ResponseBody
   @RequestMapping(value="imageUpdate" , produces="application/String;charset=UTF-8")
   public String imageUpdateProc(MultipartFile formData) {
      String uploadPath = session.getServletContext().getRealPath("/resources/img/title");
      String originFileName = formData.getOriginalFilename();
      System.out.println(uploadPath);
      String name = uploadPath+"/"+System.currentTimeMillis()+originFileName;
      String result=null;

      try {
         File newFile = new File(name);
         formData.transferTo(newFile);
         result=newFile.getName();
      } catch (Exception e) {
         e.printStackTrace();
      }
      return result;
   } //타이틀이미지 ajax로 바로 띄어주는 것

   @RequestMapping("goodsRegister")
   public String goodsRegisterProc(HttpServletRequest request,MultipartHttpServletRequest mtfRequest,Used_transaction_boardDTO dto,Used_transaction_img_boardDTO udto) {
         try {
            System.out.println("가격:"+dto.getDelivery_cost());
            dto.setId("asd");
            dto.setMember_class("보통");            
            sv.goodsInsert(mtfRequest,dto,udto);
         } catch (Exception e) {
            e.printStackTrace();
         }
      
      return "redirect:"+tc.index(request);
   }  //중고 거래 등록하는 것

   @RequestMapping("auctionWrite")
   public String auctionWriteProc() {
      return "auctionWrite";
   } //경매 글쓰기로 가는 것

   @RequestMapping("auctionWriteComplete")
   public String ActionWriteCompleteProc(MultipartHttpServletRequest mtfRequest,Auction_boardDTO adto,Auction_img_boardDTO idto) {
      
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      Date time = new Date();
      String time1 = sdf.format(time);
      try {
         //sv.addDate(time1,adto.getPeriod());
         adto.setId("asd");
         adto.setMember_class("보통");
         sv.actionInsert(mtfRequest,adto, idto,time1,adto.getPeriod());
      } catch (Exception e) {
         e.printStackTrace();
      }
      return "redirect:/";
   } //경매 글쓰기 완성 등록하면 홈으로가는 것


}