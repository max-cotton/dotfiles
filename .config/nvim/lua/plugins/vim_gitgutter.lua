return {
    { 'airblade/vim-gitgutter',
      config = function()
      	vim.cmd([[highlight GitGutterAdd guifg=#009900 ctermfg=2]])
	      vim.cmd([[highlight GitGutterChange guifg=#bbbb00 ctermfg=3]])
	      vim.cmd([[highlight GitGutterDelete guifg=#ff2222 ctermfg=1]])
	      vim.cmd([[highlight clear SignColumn]])
      end
    },
}
