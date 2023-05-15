
params.samplefile = null

timestamp = (new Date()).getTime()

def errorMessage() {
    log.info"""
    ========================
    This is an error message
    ========================
    You failed to provide the --samplefile input parameter
    Please provide this parameter as follows:
      --samplefile /full/path/to/sample/file
    The pipeline has exited with error status 1.
    """.stripIndent()
    exit 1
}

process md5{

   publishDir "output/${timestamp}", mode: 'copy'

   debug true

   input:
   path samplefile

   output:
   path('*.md5')

   shell:
   '''
   md5sum !{samplefile} > "!{samplefile}.md5"
   '''
}

workflow {
  samplefile_channel = params.samplefile != null ? Channel.fromPath(params.samplefile) : errorMessage()
  samplefile_channel | md5 
}
