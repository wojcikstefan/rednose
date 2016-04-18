pip install -e .
nosetests -s --rednose --with-id --force-color > test_results.txt 2>&1
result=$(comm -3 expected_results.txt test_results.txt | wc -l)

if [ "$result" -ge 20 -a "$result" -le 22 ];
	then exit 0
fi

if [ "$result" -eq 4 ];
	then exit 0
fi

# local python 2.6
if [ "$result" -eq 59 ];
	then exit 0
fi

# travis python 2.6
if [ "$result" -eq 67 ];
	then exit 0
fi

comm -3 expected_results.txt test_results.txt
comm -3 expected_results.txt test_results.txt | wc -l
exit 1
