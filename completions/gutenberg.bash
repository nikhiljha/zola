_gutenberg() {
    local i cur prev opts cmds
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    cmd=""
    opts=""

    for i in ${COMP_WORDS[@]}
    do
        case "${i}" in
            gutenberg)
                cmd="gutenberg"
                ;;
            
            build)
                cmd+="__build"
                ;;
            help)
                cmd+="__help"
                ;;
            init)
                cmd+="__init"
                ;;
            serve)
                cmd+="__serve"
                ;;
            *)
                ;;
        esac
    done

    case "${cmd}" in
        gutenberg)
            opts=" -h -V -c  --help --version --config   init build serve help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 1 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
                return 0
            fi
            case "${prev}" in
                
                --config)
                    COMPREPLY=($(compgen -f ${cur}))
                    return 0
                    ;;
                    -c)
                    COMPREPLY=($(compgen -f ${cur}))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        
        gutenberg__build)
            opts=" -h -V -u -o  --help --version --base-url --output-dir  "
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
                return 0
            fi
            case "${prev}" in
                
                --base-url)
                    COMPREPLY=($(compgen -f ${cur}))
                    return 0
                    ;;
                    -u)
                    COMPREPLY=($(compgen -f ${cur}))
                    return 0
                    ;;
                --output-dir)
                    COMPREPLY=($(compgen -f ${cur}))
                    return 0
                    ;;
                    -o)
                    COMPREPLY=($(compgen -f ${cur}))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        gutenberg__help)
            opts=" -h -V  --help --version  "
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
                return 0
            fi
            case "${prev}" in
                
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        gutenberg__init)
            opts=" -h -V  --help --version  <name> "
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
                return 0
            fi
            case "${prev}" in
                
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        gutenberg__serve)
            opts=" -h -V -i -p -o -u  --help --version --interface --port --output-dir --base-url  "
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
                return 0
            fi
            case "${prev}" in
                
                --interface)
                    COMPREPLY=($(compgen -f ${cur}))
                    return 0
                    ;;
                    -i)
                    COMPREPLY=($(compgen -f ${cur}))
                    return 0
                    ;;
                --port)
                    COMPREPLY=($(compgen -f ${cur}))
                    return 0
                    ;;
                    -p)
                    COMPREPLY=($(compgen -f ${cur}))
                    return 0
                    ;;
                --output-dir)
                    COMPREPLY=($(compgen -f ${cur}))
                    return 0
                    ;;
                    -o)
                    COMPREPLY=($(compgen -f ${cur}))
                    return 0
                    ;;
                --base-url)
                    COMPREPLY=($(compgen -f ${cur}))
                    return 0
                    ;;
                    -u)
                    COMPREPLY=($(compgen -f ${cur}))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
    esac
}

complete -F _gutenberg -o bashdefault -o default gutenberg
