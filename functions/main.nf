
params.help = true

def helpMessage() {
    log.info"""
    ======================
    This is a help message
    ======================
    Once very useful example of functions is to use them for generating help messages.
    This way if someone else tries to run your pipeline you can give them useful advice.
    A few things to note:
      1) "log.info" - ensure this message is printed to STDOUT and also directed to ".nextflow.log"
      2) "stripIndent()" - when message is printed to STDOUT, there is no indent
    """.stripIndent() 
}

workflow {
  if (params.help) {
    helpMessage()
    exit 0
  }
}
