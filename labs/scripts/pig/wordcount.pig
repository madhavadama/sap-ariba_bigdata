lines = LOAD '/user/training/wordcount/input/wordcount-input.txt' AS (line:chararray); 
words = FOREACH lines GENERATE FLATTEN(TOKENIZE(line)) as word; 
grouped = GROUP words BY word; 
wordcount = FOREACH grouped GENERATE group, COUNT(words); 
STORE wordcount INTO '/user/training/wordcount/output'