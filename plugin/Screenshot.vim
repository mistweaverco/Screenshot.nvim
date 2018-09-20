if exists("g:loaded_Screenshot")
        finish
endif
let g:loaded_Screenshot = 1

let s:PluginName = "Screenshot.nvim"

function! s:FileExists(filepath)
        if filereadable(a:filepath)
                return 1
        else
                return 0
        endif
endfunction

function! Screenshot#GetPicturesDir()
        if !empty($XDG_PICTURES_DIR)
                return "$XDG_PICTURES_DIR"
        else
                return "$HOME/Pictures/"
        endif
endfunction

function! Screenshot#Window()
        let dir = Screenshot#GetPicturesDir()
        let cmd =  'scrot --focused ' . dir . 'Screenshot.nvim-%Y%m%d_%H%M%S.png'
        call s:ExecExternalCommand(cmd)
endfunction

function! s:OnJobEventHandler(job_id, data, event) dict
        if a:event == 'stdout'
                let str = self.shell.' stdout: '.join(a:data)
        elseif a:event == 'stderr'
                let str = self.shell.' stderr: '.join(a:data)
        else
                let str = self.shell.' finished'
        endif
        echom str
endfunction

let s:jobEventCallbacks = {
        \ 'on_stdout': function('s:OnJobEventHandler'),
        \ 'on_stderr': function('s:OnJobEventHandler'),
        \ 'on_exit': function('s:OnJobEventHandler')
\ }

function! s:ExecExternalCommand(command)
        if has("nvim") == 1
                call jobstart(["bash", "-c", a:command])
        elseif v:version >= 800
                call job_start("bash -c " . a:command)
        else
                silent execute "!" . a:command
        endif
endfunction

command! Screenshot call Screenshot#Window()

