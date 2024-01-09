--댓글 테이블
 create table tbl_reply(
    rno number constraint pk_reply primary key,  					--댓글번호
    bno number constraint fk_reply references tbl_board(bno),		--글번호
    reply varchar2(1000),											--댓글내용
    replyer varchar2(50),											--댓글러	
    replydate date default sysdate,									--작성일
    updatedate date default sysdate									--수정일
    
 );   
 
 --댓글 시퀀스
 create sequence seq_reply;
