: "set env args" && {
	export L_OSTYPE=`uname`
	uname -a | grep "microsoft" | grep "Linux">/dev/null && if [ $? -eq 0 ]; then
		export L_OSTYPE="Windows_Linux"
	fi
}
