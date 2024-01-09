create table tbl_board (
  bno number primary key,
  title varchar2(200) not null,
  content varchar2(2000) not null,
  writer varchar2(50) not null,
  regdate date default sysdate, 
  updatedate date default sysdate
);

create sequence seq_board;

COMMIT;

begin
    for i in 1..10 loop
        insert into tbl_board(bno, title, content, writer)
        values (seq_board.nextval, '제목-' || i, '내용-' || i, 'user-' || i);
    end loop;
end;    
/

select * from tbl_board;