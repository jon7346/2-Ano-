namespace TestePOO
{
    partial class Form1
    {
        /// <summary>
        /// Variável de designer necessária.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Limpar os recursos que estão sendo usados.
        /// </summary>
        /// <param name="disposing">true se for necessário descartar os recursos gerenciados; caso contrário, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Código gerado pelo Windows Form Designer

        /// <summary>
        /// Método necessário para suporte ao Designer - não modifique 
        /// o conteúdo deste método com o editor de código.
        /// </summary>
        private void InitializeComponent()
        {
            this.button1 = new System.Windows.Forms.Button();
            this.btnAluno = new System.Windows.Forms.Button();
            this.btnProfessor = new System.Windows.Forms.Button();
            this.backgroundWorker1 = new System.ComponentModel.BackgroundWorker();
            this.btnCadastrar = new System.Windows.Forms.Button();
            this.txtCadastro = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(31, 66);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(75, 23);
            this.button1.TabIndex = 0;
            this.button1.Text = "button1";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // btnAluno
            // 
            this.btnAluno.Location = new System.Drawing.Point(31, 115);
            this.btnAluno.Name = "btnAluno";
            this.btnAluno.Size = new System.Drawing.Size(75, 23);
            this.btnAluno.TabIndex = 1;
            this.btnAluno.Text = "Aluno";
            this.btnAluno.UseVisualStyleBackColor = true;
            this.btnAluno.Click += new System.EventHandler(this.btnAluno_Click);
            // 
            // btnProfessor
            // 
            this.btnProfessor.Location = new System.Drawing.Point(31, 162);
            this.btnProfessor.Name = "btnProfessor";
            this.btnProfessor.Size = new System.Drawing.Size(75, 22);
            this.btnProfessor.TabIndex = 2;
            this.btnProfessor.Text = "Professor";
            this.btnProfessor.UseVisualStyleBackColor = true;
            this.btnProfessor.Click += new System.EventHandler(this.btnProfessor_Click);
            // 
            // btnCadastrar
            // 
            this.btnCadastrar.Location = new System.Drawing.Point(161, 66);
            this.btnCadastrar.Name = "btnCadastrar";
            this.btnCadastrar.Size = new System.Drawing.Size(119, 23);
            this.btnCadastrar.TabIndex = 3;
            this.btnCadastrar.Text = "Cadastrar";
            this.btnCadastrar.UseVisualStyleBackColor = true;
            this.btnCadastrar.Click += new System.EventHandler(this.btnCadastrar_Click);
            // 
            // txtCadastro
            // 
            this.txtCadastro.Location = new System.Drawing.Point(160, 95);
            this.txtCadastro.Multiline = true;
            this.txtCadastro.Name = "txtCadastro";
            this.txtCadastro.Size = new System.Drawing.Size(181, 157);
            this.txtCadastro.TabIndex = 4;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(353, 397);
            this.Controls.Add(this.txtCadastro);
            this.Controls.Add(this.btnCadastrar);
            this.Controls.Add(this.btnProfessor);
            this.Controls.Add(this.btnAluno);
            this.Controls.Add(this.button1);
            this.Name = "Form1";
            this.Text = "Form1";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button btnAluno;
        private System.Windows.Forms.Button btnProfessor;
        private System.ComponentModel.BackgroundWorker backgroundWorker1;
        private System.Windows.Forms.Button btnCadastrar;
        private System.Windows.Forms.TextBox txtCadastro;
    }
}

