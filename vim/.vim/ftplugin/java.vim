set makeprg=mvn\ -q\ clean\ compile
set errorformat=[ERROR]\ %f:[%l\\,%v]\ %m
nnoremap ,t :Dispatch! mvn -q clean -Dtest=%:t:r test<CR>
nnoremap ,r :Dispatch mvn -q exec:java -Dexec.mainClass=%:t:r<CR>

