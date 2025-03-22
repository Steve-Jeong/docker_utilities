홈 디렉토리에서 git clone https://github.com/Steve-Jeong/docker_utilities .utilities를 실행한다.

zsh 셸을 사용하는 경우 PATH를 수정하는 방법은 다음과 같습니다:
	1. 텍스트 에디터로 ~/.zshrc 파일을 엽니다. 예: nano ~/.zshrc
	2. 파일 끝에 다음 줄을 추가합니다:
     export PATH="$PATH:$HOME/.utilities"
	3. 파일을 저장하고 나옵니다. (nano에서는 Ctrl+X, Y, Enter)
	4. 변경 사항을 적용하려면 현재 zsh 세션을 다시 로드해야 합니다. 다음 명령을 입력하세요:
     source ~/.zshrc
	5. 이제 PATH에 .utilities 디렉토리가 추가되었으므로 어디서나 해당 디렉토리의 스크립트를 실행할 수 있습니다.

영구적으로 PATH를 수정하려면 ~/.zprofile 파일에 export 명령을 추가하는 것이 좋습니다.
참고로 zsh에서는 ~/.zshenv 파일도 로그인 셸에서 로드되므로 이 파일에 export 명령을 추가할 수도 있습니다.
PATH 수정 후에는 새 터미널을 열거나 로그아웃/로그인하여 변경 사항이 적용되었는지 확인할 수 있습니다.

