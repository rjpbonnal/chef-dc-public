default[:bioinfo][:apps_directory] = "/opt"
default[:bioinfo][:apps_download_directory] = "/opt/cache"

default[:java][:jdk_version] = '6'
default[:java][:install_flavor] = "oracle"
default[:java][:oracle]["accept_oracle_download_terms"] = true

default[:modules][:module_path] = '/usr/local/Modules/modulefiles'
default[:bioinfo][:cran_mirror] = '"http://cran.mirror.garr.it/mirrors/CRAN/"'

default[:bioinfo][:tophat]    = [{:file => "tophat-2.0.13.Linux_x86_64.tar.gz", 
                                :unpack => "tar --overwrite -xzvf",
                                :program_cache_dirname => "tophat-2.0.13.Linux_x86_64",
                                :name => "tophat",
                                :source => "http://ccb.jhu.edu/software/tophat/downloads/tophat-2.0.13.Linux_x86_64.tar.gz",
                                :version => "2.0.13",
                                :conflict_version => "2.0.9",
                                :conflict_version => "2.0.10" },
                                {:file => "tophat-2.0.11.Linux_x86_64.tar.gz", 
                                :unpack => "tar --overwrite -xzvf",
                                :program_cache_dirname => "tophat-2.0.11.Linux_x86_64",
                                :name => "tophat",
                                :source => "http://ccb.jhu.edu/software/tophat/downloads/tophat-2.0.11.Linux_x86_64.tar.gz",
                                :version => "2.0.11",
                                :conflict_version => "2.0.9",
                                :conflict_version => "2.0.10" },
                                {:file => "tophat-2.0.10.Linux_x86_64.tar.gz", 
                                :unpack => "tar --overwrite -xzvf",
                                :program_cache_dirname => "tophat-2.0.10.Linux_x86_64",
                                :name => "tophat",
                                :source => "http://ccb.jhu.edu/software/tophat/downloads/tophat-2.0.10.Linux_x86_64.tar.gz",
                                :version => "2.0.10",
                                :conflict_version => "2.0.9",
                                :conflict_version => "2.0.11" },
                                {:file => "tophat-2.0.9.Linux_x86_64.tar.gz", 
                                  :unpack => "tar --overwrite -xzvf",
                                  :program_cache_dirname => "tophat-2.0.9.Linux_x86_64",
                                  :name => "tophat",
                                  :source => "http://ccb.jhu.edu/software/tophat/downloads/tophat-2.0.9.Linux_x86_64.tar.gz",
                                  :version => "2.0.9",
                                  :conflict_version => "2.0.10",
                                  :conflict_version => "2.0.11" }
                                ]
                                
default[:bioinfo][:cufflinks] = [{:file => "cufflinks-2.2.1.Linux_x86_64.tar.gz",
                                  :unpack =>"tar --overwrite -xzvf",
                                  :program_cache_dirname => "cufflinks-2.2.1.Linux_x86_64",
                                  :name => "cufflinks",
                                  :source => "http://cufflinks.cbcb.umd.edu/downloads/cufflinks-2.2.1.Linux_x86_64.tar.gz",
                                  :version => "2.2.1",
                                  :conflict_version => "2.1.1"},
                                  {:file => "cufflinks-2.1.1.Linux_x86_64.tar.gz",
                                  :unpack =>"tar --overwrite -xzvf",
                                  :program_cache_dirname => "cufflinks-2.1.1.Linux_x86_64",
                                  :name => "cufflinks",
                                  :source => "http://cufflinks.cbcb.umd.edu/downloads/cufflinks-2.1.1.Linux_x86_64.tar.gz",
                                  :version => "2.1.1",
                                  :conflict_version => "2.2.1"}
                                ]

default[:bioinfo][:bedtools]  = [{:file=>"bedtools2-2.21.0.tar.gz",
                                  :unpack=>"tar --overwrite -xvzf",
                                  :program_cache_dirname=>"bedtools2-2.21.0",
                                  :name=>"bedtools",
                                  :source=>"https://github.com/arq5x/bedtools2/archive/v2.21.0.tar.gz",
                                  :version=>"2.21.0",
                                  :conflict_version=>"2.17.0",
                                  :conflict_version=>"2.20.1"
                                  },
                                  {:file => "bedtools-2.20.1.tar.gz",
                                  :unpack => "tar --overwrite -xzvf",
                                  :program_cache_dirname => "bedtools2-2.20.1",
                                  :name => "bedtools",
                                  :source => "https://github.com/arq5x/bedtools2/releases/download/v2.20.1/bedtools-2.20.1.tar.gz",
                                  :version => "2.20.1",
                                  :conflict_version => "2.17.0",
                                  :conflict_version=>"2.21.0"},
                                  {:file => "BEDTools.v2.17.0.tar.gz",
                                  :unpack => "tar --overwrite -xzvf",
                                  :program_cache_dirname => "bedtools-2.17.0",
                                  :name => "bedtools",
                                  :source => "http://bedtools.googlecode.com/files/BEDTools.v2.17.0.tar.gz",
                                  :version => "2.17.0",
                                  :conflict_version => "2.20.1",
                                  :conflict_version=>"2.21.0"}
                                  ]

default[:bioinfo][:picard]    = [{:file => "picard-tools-1.102.zip",
                                  :unpack => "unzip -o",
                                  :program_cache_dirname => "picard-tools-1.102",
                                  :name => "picard",
                                  :source => "http://sourceforge.net/projects/picard/files/picard-tools/1.102/picard-tools-1.102.zip/download",
                                  :version => "1.102",
                                  :conflict_version=>"1.122"},
                                  {
                                   :file=>"picard-tools-1.122.zip",
                                   :unpack=>"unzip -o",
                                   :program_cache_dirname=>"picard-tools-1.122",
                                   :name=>"picard",
                                   :source=>"https://github.com/broadinstitute/picard/releases/download/1.122/picard-tools-1.122.zip",
                                   :version=>"1.122",
                                   :conflict_version=>"1.102" 
                                  }
                                ]

default[:bioinfo][:samtools]  = [{:file => "samtools-0.1.19.tar.bz2",
                                   :unpack => "tar --overwrite -xjvf",
                                   :program_cache_dirname => "samtools-0.1.19",
                                   :name => "samtools",
                                   :source => "http://downloads.sourceforge.net/project/samtools/samtools/0.1.19/samtools-0.1.19.tar.bz2?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fsamtools%2Ffiles%2Fsamtools%2F0.1.19%2Fsamtools-0.1.19.tar.bz2%2Fdownload%3Fuse_mirror%3Dgarr&ts=1384248452&use_mirror=garr",
                                   :version => "0.1.19",
                                   :conflict_version =>"1.1"},
                                   {
                                    :file => "samtools-1.1.tar.bz2",
                                    :unpack => "tar --overwrite -xjvf",
                                    :program_cache_dirname => "samtools-1.1",
                                    :name => "samtools",
                                    :source =>"http://downloads.sourceforge.net/project/samtools/samtools/1.1/samtools-1.1.tar.bz2?r=&ts=1413892495&use_mirror=heanet",
                                    :version =>"1.1",  
                                    :conflict_version =>"0.1.19"
                                    }
                                   ]
                                
default[:bioinfo][:tabix]     = [{:file => "tabix-0.2.6.tar.bz2",
                                  :unpack => "tar --overwrite -xvjf",
                                  :program_cache_dirname => "tabix-0.2.6",
                                  :name => "tabix",
                                  :source => "http://downloads.sourceforge.net/project/samtools/tabix/tabix-0.2.6.tar.bz2?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fsamtools%2Ffiles%2Ftabix%2F&ts=1384249234&use_mirror=garr",
                                  :version => "0.2.6"}
                                ]
                                  
default[:bioinfo][:star]      = [{:file => "STAR_2.3.0e.Linux_x86_64_static.tgz",
                                  :unpack => "tar --overwrite -xzvf",
                                  :program_cache_dirname => "STAR_2.3.0e.Linux_x86_64_static",
                                  :name => "STAR",
                                  :source => "https://rna-star.googlecode.com/files/STAR_2.3.0e.Linux_x86_64_static.tgz",
                                  :version => "2.3.0e"}]
                                  
default[:bioinfo][:R]         = [{:file => "R-3.1.0.tar.gz",
                                  :unpack => "tar --overwrite -xzvf",
                                  :program_cache_dirname => "R-3.1.0",
                                  :name => "R",
                                  :source => "http://cran.mirror.garr.it/mirrors/CRAN/src/base/R-3/R-3.1.0.tar.gz",
                                  :version => "3.1.0",
                                  :conflict_version => "3.0.1",
                                  :conflict_version => "3.0.2"},
                                { :file => "R-3.0.2.tar.gz",
                                  :unpack => "tar --overwrite -xzvf",
                                  :program_cache_dirname => "R-3.0.2",
                                  :name => "R",
                                  :source => "http://cran.mirror.garr.it/mirrors/CRAN/src/base/R-3/R-3.0.2.tar.gz",
                                  :version => "3.0.2",
                                  :conflict_version => "3.0.1"},
                                { :file => "R-3.0.1.tar.gz",
                                  :unpack => "tar --overwrite -xzvf",
                                  :program_cache_dirname => "R-3.0.1",
                                  :name => "R",
                                  :source => "http://cran.mirror.garr.it/mirrors/CRAN/src/base/R-3/R-3.0.1.tar.gz",
                                  :version => "3.0.1",
                                  :conflict_version => "3.0.2"}]
                                  
default[:bioinfo][:phylocsf] = [
                                 {:file => "PhyloCSF-10-2013.tar.gz",
                                 :unpack => "tar --overwrite -xzvf",
                                 :program_cache_dirname => "PhyloCSF-10-2013",
                                 :name => "PhyloCSF",
                                 :source => "git://github.com/mlin/PhyloCSF.git",
                                 :version => "10-2013"}]

default[:bioinfo][:macs] = [{:file => "MACS-2.0.10.tar.gz",
                             :unpack => "tar --overwrite -xzvf",
                             :program_cache_dirname => "MACS-2.0.10",
                             :name => "MACS",
                             :source => "git://github.com/taoliu/MACS.git",
                             :version => "2.0.10",
                             :git_revision => "git reset --hard c217f354fe13d86ac8b183cb0a02095b29969590",
                             :conflict_version => "1.4.2"},
                             {:file => "MACS-1.4.2.tar.gz",
                              :unpack => "tar --overwrite -xzvf",
                              :program_cache_dirname => "MACS-1.4.2",
                              :name => "MACS",
                              :source => "https://github.com/downloads/taoliu/MACS/MACS-1.4.2-1.tar.gz",
                              :version => "1.4.2",
                              #:git_revision => "git checkout tags/v1.4.2",
                              :conflict_version => "2.0.10"}
                            ]
default[:bioinfo][:macs2]=[{
                            :file=>"MACS2-2.1.0.20140616.tar.gz",
                            :unpack=>"tar --overwrite -xzvf",
                            :program_cache_dirname=>"MACS2-2.1.0.20140616",
                            :name=>"MACS2",
                            :source=>"https://pypi.python.org/packages/source/M/MACS2/MACS2-2.1.0.20140616.tar.gz",
                            :version=>"2.1.0"
                            }]


default[:bioinfo][:htseq] = [{:file => "HTSeq-0.5.4p5.tar.gz",
                              :unpack => "tar --overwrite -zxvf",
                              :program_cache_dirname => "HTSeq-0.5.4p5",
                              :name => "HTSeq",
                              :source => "https://pypi.python.org/packages/source/H/HTSeq/HTSeq-0.5.4p5.tar.gz#md5=b6d7d5c412bf067e6c33ee1550d99a52",
                              :version => "0.5.4p5"
                              },
                              {:file => "HTSeq-0.6.1.tar.gz",
                              :unpack => "tar --overwrite -zxvf",
                              :program_cache_dirname => "HTSeq-0.6.1",
                              :name => "HTSeq",
                              :source => "https://pypi.python.org/packages/source/H/HTSeq/HTSeq-0.6.1.tar.gz#md5=b7f4f38a9f4278b9b7f948d1efbc1f05",
                              :version => "0.6.1"
                              }
                            ]

default[:bioinfo][:R_packages] = {:bioconductor => %w(affy
                                                      limma
                                                      lumi
                                                      beadsarray
                                                      GEOquery
                                                      ArrayExpress
                                                      virtualArray
                                                      HTqPCR
                                                      ggplot2
                                                      DESeq
                                                      DESeq2
                                                      biomaRt
                                                      cummeRbund
                                                      GO.db),
                                  :cran         => %w(
                                                      RColorBrewer
                                                      VennDiagram
                                                      abind
                                                      e1071
                                                      Matrix
                                                      pls
                                                      plsdepot
                                                      plyr
                                                      randomGLM
                                                      WGCNA
                                                      DBI
                                                      RSQLite
                                                      cluster
                                                      Rserve
                                            )
}
default[:dbs][:kyotocabinet]    = [
                                {:file => "kyotocabinet-1.2.76.tar.gz", 
                                :unpack => "tar --overwrite -xzvf",
                                :program_cache_dirname => "kyotocabinet-1.2.76",
                                :name => "kyotocabinet",
                                :source => "http://fallabs.com/kyotocabinet/pkg/kyotocabinet-1.2.76.tar.gz",
                                :version => "1.2.76"}
                              ]

default[:bioinfo][:trimmomatic]    = [{:file => "Trimmomatic-0.32.zip",
                                  :unpack => "unzip -o",
                                  :program_cache_dirname => "Trimmomatic-0.32",
                                  :name => "trimmomatic",
                                  :source => "http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/Trimmomatic-0.32.zip",
                                  :version => "0.32"}
                                ]
default[:bioinfo][:express]     =[
                                  {:file => "express-1.5.1-linux_x86_64.tgz",
                                    :unpack =>"tar --overwrite -xzvf", 
                                    :program_cache_dirname => "express-1.5.1-linux_x86_64",
                                    :name => "express",
                                    :source => "http://bio.math.berkeley.edu/eXpress/downloads/express-1.5.1/express-1.5.1-linux_x86_64.tgz",
                                    :version => "1.5.1"}
                                    ]
default[:bioinfo][:sratoolkit]  =[{
                                  :file => "sratoolkit.2.3.5-ubuntu64.tar.gz",
                                  :unpack => "tar --overwrite -xvzf",
                                  :program_cache_dirname => "sratoolkit.2.3.5-ubuntu64",
                                  :name => "sratoolkit",
                                  :source =>"http://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/2.3.5/sratoolkit.2.3.5-ubuntu64.tar.gz",
                                  :version =>"2.3.5",
                                  :conflict_version => "2.3.1" },
                                  {
                                  :file => "sratoolkit.2.3.1-ubuntu64.tar.gz",
                                  :unpack => "tar --overwrite -xvzf",
                                  :program_cache_dirname => "sratoolkit.2.3.1-ubuntu64",
                                  :name => "sratoolkit",
                                  :source =>"http://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/2.3.1/sratoolkit.2.3.1-ubuntu64.tar.gz",
                                  :version =>"2.3.1",
                                  :conflict_version => "2.3.5" }
                                ]
default[:bioinfo][:bowtie2] =[{
                              :file =>"bowtie2-2.2.1-linux-x86_64.zip",
                              :unpack => "unzip -o",
                              :program_cache_dirname => "bowtie2-2.2.1",
                              :name => "bowtie2",
                              :source =>"http://downloads.sourceforge.net/project/bowtie-bio/bowtie2/2.2.1/bowtie2-2.2.1-linux-x86_64.zip?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fbowtie-bio%2Ffiles%2Fbowtie2%2F2.2.1%2F&ts=1396536786&use_mirror=garr",
                              :version => "2.2.1",
                              :conflict_version=>"2.2.3"
                              },
                              {
                              :file=>"bowtie2-2.2.3-linux-x86_64.zip",
                              :unpack=>"unzip -o",
                              :program_cache_dirname=>"bowtie2-2.2.3",
                              :name=>"bowtie2",
                              :source=>"http://downloads.sourceforge.net/project/bowtie-bio/bowtie2/2.2.3/bowtie2-2.2.3-linux-x86_64.zip?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fbowtie-bio%2Ffiles%2Fbowtie2%2F2.2.3%2F&ts=1413896140&use_mirror=skylink",
                              :version=>"2.2.3",
                              :conflict_version=>"2.2.1"  
                                }]
default[:bioinfo][:bowtie1] =[{
                              :file =>"bowtie-1.0.1-linux-x86_64.zip",
                              :unpack => "unzip -o",
                              :program_cache_dirname => "bowtie-1.0.1",
                              :name => "bowtie1",
                              :source =>"http://downloads.sourceforge.net/project/bowtie-bio/bowtie/1.0.1/bowtie-1.0.1-linux-x86_64.zip?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fbowtie-bio%2Ffiles%2Fbowtie%2F1.0.1%2F&ts=1406281723&use_mirror=skylink",
                              :version => "1.0.1"
                              }]

default[:bioinfo][:iseerna] =[{
                              :file =>"iSeeRNA-1.2.2.x86_64.tar.gz",
                              :unpack => "tar --overwrite --owner root --group root --no-same-owner -xvzf",
                              :program_cache_dirname => "iSeeRNA-1.2.2",
                              :name => "iSeeRNA",
                              :source =>"http://sunlab.lihs.cuhk.edu.hk/iSeeRNA/data/iSeeRNA-1.2.2.x86_64.tar.gz",
                              :version => "1.2.2"
                              }] 
default[:bioinfo][:rsem] =[{
                              :file =>"rsem-1.2.15.tar.gz",
                              :unpack => "tar --overwrite --owner root --group root --no-same-owner -xvzf",
                              :program_cache_dirname => "rsem-1.2.15",
                              :name => "rsem",
                              :source =>"http://deweylab.biostat.wisc.edu/rsem/src/rsem-1.2.15.tar.gz",
                              :version => "1.2.15"
                              }]
default[:bioinfo][:pyicoteo]=[
                              {:file =>"regulatorygenomicsupf-pyicoteo-dd9b07132732.zip",
                               :unpack =>"unzip -o",   
                               :program_cache_dirname => "regulatorygenomicsupf-pyicoteo-dd9b07132732",
                               :name =>"pyicoteo",
                               :source =>"https://bitbucket.org/regulatorygenomicsupf/pyicoteo/get/dd9b07132732.zip",
                               :version =>"2.0.6"
                              }]
default[:bioinfo][:fastqc]=[{
                            :file =>"fastqc_v0.11.1.zip",
                            :unpack => "unzip -o",
                            :program_cache_dirname =>"FastQC",
                            :name =>"fastqc",
                            :source =>"http://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.1.zip",
                            :version =>"0.11.1",
                            :conflict_version=>"0.11.2"
                            },
                            {
                              :file=>"fastqc_v0.11.2.zip",
                              :unpack=>"unzip -o",
                              :program_cache_dirname=>"FastQC",
                              :name=>"fastqc",
                              :source=>"http://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.2.zip",
                              :version=>"0.11.2",
                              :conflict_version=>"0.11.1"

                            }]    
default[:bioinfo][:sailfish]=[{
                              :file =>"Sailfish-0.6.3-Linux_x86-64.tar.gz",
                              :unpack =>"tar --overwrite -xzvf",
                              :program_cache_dirname =>"Sailfish-0.6.3-Linux_x86-64",
                              :name =>"Sailfish",
                              :source =>"https://github.com/kingsfordgroup/sailfish/releases/download/v0.6.3/Sailfish-0.6.3-Linux_x86-64.tar.gz",
                              :version =>"0.6.3"
                              }]

default[:bioinfo][:casava]=[{
                            :file => "CASAVA_v1.8.2.tar",
                            :unpack => "tar --overwrite -xvjf",
                            :program_cache_dirname => "CASAVA_v1.8.2",
                            :name =>"CASAVA",
                            :source =>"ftp://webdata2:webdata2@ussd-ftp.illumina.com/MyIllumina/6e422abb-dc36-4d09-b223-0eafef26ddc5/CASAVA_v1.8.2.tar",
                            :version =>"1.8.2"
                            }]
default[:bioinfo][:scipy]=[{
                           :file =>"scipy-0.14.0.tar.gz",
                           :unpack => "tar --overwrite -xvzf",
                           :program_cache_dirname => "scipy-0.14.0",
                           :name =>"Scipy",
                           :source =>"http://downloads.sourceforge.net/project/scipy/scipy/0.14.0/scipy-0.14.0.tar.gz",
                           :version =>"0.14.0"
                          }]

default[:bioinfo][:iReckon]=[{
                             :file => "IReckon-1.0.7.jar",
                             :name =>"IReckon",
                             :source =>"http://compbio.cs.toronto.edu/ireckon/IReckon-1.0.7.jar",
                             :version =>"1.0.7"
                            }]
default[:bioinfo][:bwa]=[{
                          :file =>"bwa-0.7.10.tar.bz2",
                          :unpack =>"tar --overwrite -xvjf",
                          :program_cache_dirname=>"bwa-0.7.10",
                          :name=>"bwa",
                          :source=>"http://downloads.sourceforge.net/project/bio-bwa/bwa-0.7.10.tar.bz2?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fbio-bwa%2Ffiles%2F&ts=1411378086&use_mirror=cznic",
                          :version=>"0.7.10"
                          }]

default[:bioinfo][:python]=[{
                            :name =>"python",
                            :version =>"0.8.0"
  }]

default[:bioinfo][:rpy]= [{
                          :file=>"rpy2-2.4.3.tar.gz",
                          :unpack =>"tar --overwrite -xvzf",
                          :program_cache_dirname=>"rpy2-2.4.3",
                          :name=>"rpy",
                          :source=>" ",
                          :version=>"2.4.3"
                          }]
default[:bioinfo][:bcftools] =[{
                                :file =>"bcftools-1.1.tar.bz2",
                                :unpack =>"tar --overwrite -xjvf",
                                :program_cache_dirname=>"bcftools-1.1",
                                :name =>"bcftools",
                                :source=>"http://sourceforge.net/projects/samtools/files/samtools/1.1/bcftools-1.1.tar.bz2/download",
                                :version=>"1.1"  
                                }]


default[:bioinfo][:qualitymetrics] =[{
                                      :file=>"ccQualityControl.v.1.1.tar.gz",
                                      :unpack=>"tar --overwrite -xzvf",
                                      :program_cache_dirname=>"phantompeakqualtools",
                                      :name=>"qualitymetrics",
                                      :source=>"https://phantompeakqualtools.googlecode.com/files/ccQualityControl.v.1.1.tar.gz",
                                      :version=>"1.1"
                                     }]


default[:bioinfo][:ucsctools]=[{
                                :file=>"jksrc.v306.zip",
                                :unpack=>"unzip -o",
                                :program_cache_dirname=>"kent",
                                :name=>"ucsctools",
                                :source=>"http://hgdownload.cse.ucsc.edu/admin/jksrc.v306.zip",
                                :version=>"3.0.6"
                                }]
default[:bioinfo][:idrCode]=[{
                              :file=>"idrCode.tar.gz",
                              :unpack=>"tar --overwrite -xzvf",
                              :program_cache_dirname=>"idrCode",
                              :name=>"idrCode",
                              :source=>"https://sites.google.com/site/anshulkundaje/projects/idr/idrCode.tar.gz?attredirects=0",
                              :version=>"0.0"
                             }]

default[:bioinfo][:chromInfo]=[{
                              :file=>"chromInfo.txt.gz",
                              :unpack=>"gunzip",
                              :program_cache_dirname=>"chromInfo",
                              :name=>"chromInfo",
                              :source=>"http://hgdownload.cse.ucsc.edu/goldenPath/hg19/database/chromInfo.txt.gz",
                              :version=>"0.0"
                             }]
default[:bioinfo][:fastx_toolkit]=[{
                                  :file=>"fastx_toolkit-0.0.14.tar.bz2",
                                  :unpack=>"tar --overwrite -xjvf",
                                  :program_cache_dirname=>"fastx_toolkit-0.0.14",
                                  :name=>"fastx_toolkit",
                                  :source=>"https://github.com/agordon/fastx_toolkit/releases/download/0.0.14/fastx_toolkit-0.0.14.tar.bz2",
                                  :version=>"0.0.14"
                                  }]
default[:bioinfo][:cutadapt]=[{
                              :file=>"cutadapt-1.6.tar.gz",
                              :unpack=>"tar --overwrite -xjvf",
                              :program_cache_dirname=>"cutadapt-1.6",
                              :name=>"cutadapt",
                              :source=>"https://pypi.python.org/packages/source/c/cutadapt/cutadapt-1.6.tar.gz#md5=3e65224255f6a67864c9be61a66c4c33",
                              :version=>"1.6"
                             }]
default[:bioinfo][:trim_galore]=[{
                                :file=>"trim_galore_v0.3.7.zip",
                                :unpack=>"unzip -o",
                                :program_cache_dirname=>"trim_galore_zip",
                                :name=>"trim_galore",
                                :source=>"http://www.bioinformatics.babraham.ac.uk/projects/trim_galore/trim_galore_v0.3.7.zip",
                                :version=>"0.3.7"
                                }]
default[:bioinfo][:bdg2bw]=[{
                             :file=>"gist2469050-b9bfc4b4e0fc4744cd0cb46b096b6bb0233ec177.tar.gz",
                             :unpack=>"tar --overwrite -xvzf",
                             :program_cache_dirname=>"gist2469050-b9bfc4b4e0fc4744cd0cb46b096b6bb0233ec177",
                             :name=>"bdg2bw",
                             :source=>"https://gist.github.com/taoliu/2469050/download",
                              :version=>"0.0"
                           }]





