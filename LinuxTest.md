<h1 align="center">리눅스 시험 대비</h1>

## 쿼터

- 사용자들에게 용량을 제한해서 제공해주는 기능

### 관련 명령어

- quotacheck : 쿼터 설정 파일을 확인하여, 있으면 검사하고 없으면 생성하는 명령어
- edquota : 텍스트 편집기를 이용하여 제한 영역을 설정
    * -u : 해당 사용자의 제한 영역을 설정
    * -g : 해당 그룹의 제한 영역을 설정
- quotaon : 쿼터를 시작

## 권한 설정

    - chmod : 권한 관리
        - 대상
            - u : user의 권한
            - g : group의 권한 
            - o : other의 권한
            - a : all의 권한
        - operator
            - \+ : 해당 권한을 추가한다.
            - \- : 해당 권한을 제거한다.
        - modes
            - r : read 권한 (읽기)
            - w : write 권한 (쓰기)
            - x : excute 권한 (실행), 디렉터리에 실행 권한이 없다면 해당 디렉터리 내부 파일들에 접근이 불가능 하다.
            - t : sticky 비트 설정, 디렉토리에 적용되면 디렉토리 소유자나 파일 소유자 또는 슈퍼유저가 아닌 사용자들은 파일을 삭제하거나 이름을 변경하지 못하도록 막음, 파일 또는 디렉토리 생성은 누구나 할 수 있음

## 소유권 변환 

    - ex) chown noonzib.latis test.txt : test.txt 파일의 소유권은 noonzib에그룹 소유권은 latis로 변경한다.

## 명령어 정리

    - df : Disk free, 디스크 여유 공간 확인
    - du : Disk Usage, 지정된 디렉터리의 디스크 사용량을 표시하는명령어 이다.
    - fdisk : 파티션 테이블을 관리하는 명령어
    - mount : 물리적 디렉터리에 연결, -o loop 옵션 iso 파일 마운트
    - umount : 인식된 장치들, 플로피디스크, 시디룸, 하드디스크를인식하지 못하게 해준다
    - unmount : 없는 명령!!
    - eject : 미디어를 꺼낼 때 사용
    - fsck : 파일 시스템을 검사하고 수리하는 명령이다.
    - umask : 파일 접근으 조정하는 역할, -S 옵션 umask 값을 확인
    - chsh : Change Shell
    - cat : 파일을 읽음, ex) cat /etc/shells 쉘의 목록 확인
    - alias : 커맨드 생성 ex) alias c=clear, c를 입력하면 clear가 실행됨
    - ps : 현재 시스템에서 돌고있는 프로세스를 보여주는 가장 기본적인 명령어

## 쉘

    - sh (bourne shell) : "근본" (오리지널)
    - bash : 현재 리눅스의 표준 쉘
    - csh : C 언어 

## 환경변수
    - TMOUT : 자동로그아웃 설정